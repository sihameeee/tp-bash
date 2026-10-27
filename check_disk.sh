#!/bin/bash

SEUIL="${1:-80}"
UTILISATION=$(df -P / | awk 'NR==2 {print $5}' | tr -d '%')

if [ "$UTILISATION" -ge "$SEUIL" ]; then
    echo "ALERTE : espace disque utilisé à ${UTILISATION}% (seuil : ${SEUIL}%)"
    exit 1
else
    echo "OK : espace disque utilisé à ${UTILISATION}% (seuil : ${SEUIL}%)"
    exit 0
fi
