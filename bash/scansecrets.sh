#!/usr/bin/env bash
set -euo pipefail

# ANSI color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BOLD='\033[1m'
NC='\033[0m' # No Color

# Ensure execution occurs within a git repository
if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo -e "${RED}Error: Must be run inside a Git repository.${NC}" >&2
    exit 1
fi

# High-risk credential signatures formatted as "Descriptor:Regex"
PATTERNS=(
    "AWS Access Key ID:AKIA[0-9A-Z]{16}"
    "Private Key Block:-----BEGIN [A-Z ]*PRIVATE KEY-----"
    "GitHub Token:(ghp|gho|ghu|ghs|ghr)_[A-Za-z0-9_]{36,}"
    "Slack Token:xox[baprs]-[0-9a-zA-Z]{10,48}"
    "Generic Secret Assignment:([pP]assword|[sS]ecret|[aA]pi[kK]ey|[aA]pi_[kK]ey|[aA]uth_[tT]oken)[[:space:]]*[:=][[:space:]]*['\"][^'\"[:space:]]{8,}['\"]"
)

# Identify added/copied/modified files staged for commit
STAGED_FILES=$(git diff --cached --name-only --diff-filter=ACM)

if [[ -z "$STAGED_FILES" ]]; then
    exit 0
fi

SECRETS_FOUND=0

echo -e "${YELLOW}Scanning staged files for raw secrets...${NC}"

# Loop through each staged file and check added lines
while IFS= read -r file; do
    # Skip binary files
    if git diff --cached --numstat -- "$file" | grep -q '^-'; then
        continue
    fi

    # Extract only added lines (starts with '+', excluding diff header '+++')
    ADDED_LINES=$(git diff --cached -U0 --no-color -- "$file" | grep -E "^\+[^+]" || true)

    if [[ -z "$ADDED_LINES" ]]; then
        continue
    fi

    for item in "${PATTERNS[@]}"; do
        NAME="${item%%:*}"
        REGEX="${item#*:}"

        MATCHES=$(echo "$ADDED_LINES" | grep -E -i "$REGEX" || true)

        if [[ -n "$MATCHES" ]]; then
            echo -e "\n${RED}${BOLD}[BLOCKED] Potential ${NAME} detected in:${NC} ${file}"
            echo "$MATCHES" | sed 's/^+/  line: /'
            SECRETS_FOUND=1
        fi
    done
done <<< "$STAGED_FILES"

if [[ "$SECRETS_FOUND" -ne 0 ]]; then
    echo -e "\n${RED}${BOLD}Commit rejected:${NC} Secrets were detected in your staged changes."
    echo -e "Remove the credentials or move them to environment variables before committing."
    echo -e "To bypass this check in an emergency, use: ${YELLOW}git commit --no-verify${NC}\n"
    exit 1
fi

echo -e "${GREEN}No secret patterns detected.${NC}"
exit 0
