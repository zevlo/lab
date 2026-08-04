#!/bin/bash
# Vault - Rolling Archiver and Retention Manager

SOURCE_DIR="/etc/nginx" # Directory you want to backup
BACKUP_DIR="/opt/backups/nginx"
RETENTION_DAYS=30
DATE=$(date "+%Y-%m-%d_%H-%M-%S")
ARCHIVE_NAME="vault_backup_${DATE}.tar.gz"

# Ensure backup directory exists
mkdir -p "$BACKUP_DIR"

echo "Securing $SOURCE_DIR into $BACKUP_DIR/$ARCHIVE_NAME..."

# Create compressed tarball
if tar -czf "$BACKUP_DIR/$ARCHIVE_NAME" "$SOURCE_DIR" 2>/dev/null; then
    echo "Backup successful: $ARCHIVE_NAME"
    
    # Prune old backups
    echo "Enforcing $RETENTION_DAYS-day retention policy..."
    DELETED_COUNT=$(find "$BACKUP_DIR" -type f -name "vault_backup_*.tar.gz" -mtime +$RETENTION_DAYS -delete -print | wc -l)
    
    if [ "$DELETED_COUNT" -gt 0 ]; then
        echo "Pruned $DELETED_COUNT old backups from the vault."
    else
        echo "No old backups required pruning."
    fi
else
    echo "ERROR: Failed to create backup archive." >&2
    exit 1
fi
