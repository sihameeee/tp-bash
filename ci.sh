#!/bin/bash
set -Eeuo pipefail

LOG="ci.log"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*" | tee -a "$LOG"
}

trap 'code=$?; echo "[$(date "+%Y-%m-%d %H:%M:%S")] ECHEC : code $code" | tee -a "$LOG"; exit "$code"' ERR

if [ -z "${1:-}" ]; then
    log "ERREUR : URL du dépôt manquante."
    echo "Utilisation : $0 <URL_GITHUB>" >&2
    exit 1
fi

URL="$1"
NOM=$(basename "$URL" .git)
DOSSIER="$NOM"

log "Début du pipeline CI/CD"

if [ -d "$DOSSIER/.git" ]; then
    log "Mise à jour du dépôt $DOSSIER"
    git -C "$DOSSIER" pull
else
    log "Clonage du dépôt $URL"
    git clone "$URL" "$DOSSIER"
fi

log "Début des tests"

if [ -f "$DOSSIER/test.sh" ]; then
    bash "$DOSSIER/test.sh"
else
    log "Aucun fichier test.sh : tests simulés."
fi

log "Pipeline terminé avec succès."
exit 0
