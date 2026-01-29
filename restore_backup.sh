#!/bin/bash

# Script de restauration des sauvegardes chiffrées
# Usage: ./restore_backup.sh <fichier.tar.gz.gpg>

PASSPHRASE="BackupSecure2026!"
BACKUP_FILE=$1

if [ -z "$BACKUP_FILE" ]; then
    echo "Usage: $0 <fichier_backup.tar.gz.gpg>"
    echo ""
    echo "Sauvegardes disponibles:"
    ls -la *.tar.gz.gpg 2>/dev/null
    exit 1
fi

if [ ! -f "$BACKUP_FILE" ]; then
    echo "Erreur: Fichier $BACKUP_FILE non trouve"
    exit 1
fi

# Creer un dossier de restauration
RESTORE_DIR="restore_$(date +%Y%m%d_%H%M%S)"
mkdir -p $RESTORE_DIR

echo "=== Restauration de $BACKUP_FILE ==="

# Dechiffrer et extraire
echo "Dechiffrement et extraction..."
gpg --batch --yes --passphrase "$PASSPHRASE" -d "$BACKUP_FILE" 2>/dev/null | tar -xzf - -C $RESTORE_DIR

echo "=== Restauration terminee ==="
echo "Fichiers extraits dans: $RESTORE_DIR"
ls -la $RESTORE_DIR
