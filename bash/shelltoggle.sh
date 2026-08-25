#!/bin/zsh
# This script demonstrates how to toggle shell options

# Display original status
echo "Original shell options status:"
set -o | grep "noglob\|nounset"

# Enable options
echo -e "\nEnabling options..."
set -o noglob  # Disable filename expansion (globbing)
set -o nounset # Treat unset variables as an error
# Alternative short form: set -f -u

# Display status after enabling
echo -e "\nStatus after enabling options:"
set -o | grep "noglob\|nounset"

# Test the enabled options
echo -e "\nTesting noglob (pattern matching disabled):"
echo * # With noglob, * will not expand to filenames

echo -e "\nTesting nounset (unset variables error):"
# Uncommenting the next line would cause an error when nounset is enabled
# echo $undefined_variable

# Disable options
echo -e "\nDisabling options..."
set +o noglob  # Enable filename expansion (globbing)
set +o nounset # Do not treat unset variables as an error
# Alternative short form: set +f +u

# Display status after disabling
echo -e "\nStatus after disabling options:"
set -o | grep "noglob\|nounset"

# Test after disabling
echo -e "\nTesting after disabling noglob (pattern matching enabled):"
echo * # Now * will expand to show filenames
