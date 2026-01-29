#!/bin/bash

echo "=============================="
echo "   Enumeration DVWA"
echo "=============================="

# Demande de l'URL DVWA (respect de la casse)
read -p "Entrez l'URL de DVWA (ex: http://127.0.0.1/DVWA/): " URL

# Wordlist
WORDLIST="/usr/share/wordlists/dirb/common.txt"

echo ""
echo "Choisissez l'outil à utiliser :"
echo "1) Gobuster (rendu type Feroxbuster)"
echo "2) Feroxbuster"
read -p "Votre choix (1 ou 2) : " CHOICE

echo ""
echo "Les dossiers et les fichiers ouverts sont :"
echo "------------------------------------------"

if [ "$CHOICE" == "1" ]; then
    echo "[*] Lancement de Gobuster (rendu type Feroxbuster)..."

    gobuster dir \
    -u "$URL" \
    -w "$WORDLIST" \
    -s 200,301 \
    -b "" \
    -q | awk '{print $2, "'"$URL"'"$1}'

elif [ "$CHOICE" == "2" ]; then
    echo "[*] Lancement de Feroxbuster..."

    feroxbuster \
    -u "$URL" \
    -w "$WORDLIST" \
    --status-codes 200,301 \
    --quiet

else
    echo "[!] Choix invalide"
    exit 1
fi
