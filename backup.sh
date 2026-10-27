#!/bin/bash
set -Eeuo pipefail

trap 'echo "Erreur à la ligne $LINENO : sauvegarde interrompue." >&2' ERR

if [ "$#" -ne 1 ]; then
    echo "Utilisation : $0 <dossier>" >&2
    exit 1
fi

DOSSIER="$1"
BACKUP_DIR="backups"

if [ ! -d "$DOSSIER" ]; then
    echo "Erreur : le dossier '$DOSSIER' n'existe pas." >&2
    exit 1
fi

mkdir -p "$BACKUP_DIR"

NOM=$(basename "$DOSSIER")
DATE=$(date +%Y-%m-%d_%H-%M-%S)
ARCHIVE="$BACKUP_DIR/${NOM}_${DATE}.tar.gz"

tar -czf "$ARCHIVE" "$DOSSIER"

echo "Sauvegarde créée : $ARCHIVE"

for fichier in "$BACKUP_DIR"/*.tar.gz; do
    [ -f "$fichier" ] || continue

    if find "$fichier" -maxdepth 0 -mtime +7 | grep -q .; then
        rm -- "$fichier"
        echo "Ancienne sauvegarde supprimée : $fichier"
    fi
done

echo "Sauvegarde terminée avec succès."
exit 0
