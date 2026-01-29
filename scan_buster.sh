#!/bin/bash

# --- Couleurs ---
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

echo "=============================="
echo "   Enumeration Sécurisée DVWA"
echo "=============================="

read -p "Entrez l'URL de la cible (ex: http://127.0.0.1/DVWA/): " URL

if [[ -z "$URL" || ! "$URL" =~ ^https?:// ]]; then
    echo -e "${RED}[!] Erreur : Vous devez spécifier une URL valide commençant par http:// ou https://${NC}"
    exit 1
fi


DOMAIN=$(echo "$URL" | awk -F[/:] '{print $4}')
if [[ "$DOMAIN" == "google.com" || "$DOMAIN" == "facebook.com" ]]; then
    echo -e "${RED}[!] Scan interdit sur ce domaine.${NC}"
    exit 1
fi

WORDLIST="/usr/share/wordlists/dirb/common.txt"


if [ ! -f "$WORDLIST" ]; then
    echo -e "${RED}[!] Erreur : La wordlist $WORDLIST est introuvable.${NC}"
    exit 1
fi

echo ""
echo "Choisissez l'outil à utiliser :"
echo "1) Gobuster (rendu type Feroxbuster)"
echo "2) Feroxbuster"
read -p "Votre choix (1 ou 2) : " CHOICE

echo ""
echo "Les dossiers et les fichiers ouverts sont :"
echo "------------------------------------------"

if [ "$CHOICE" == "1" ]; then
    # Vérifie si gobuster est installé
    if ! command -v gobuster &> /dev/null; then echo "Gobuster n'est pas installé"; exit 1; fi
    
    echo -e "${GREEN}[*] Lancement de Gobuster...${NC}"
    # Utilisation de -z pour éviter les faux positifs et awk pour le formatage
    gobuster dir -u "$URL" -w "$WORDLIST" -s "200,301" -b "" --no-error -q | awk '{print "[+] Found: " "'"$URL"'"$1 " (Status: " $2 ")"}'

elif [ "$CHOICE" == "2" ]; then
    # Vérifie si feroxbuster est installé
    if ! command -v feroxbuster &> /dev/null; then echo "Feroxbuster n'est pas installé"; exit 1; fi

    echo -e "${GREEN}[*] Lancement de Feroxbuster...${NC}"
    feroxbuster -u "$URL" -w "$WORDLIST" --status-codes 200,301 --quiet -n

else
    echo -e "${RED}[!] Choix invalide ou contournement détecté.${NC}"
    exit 1
fi
