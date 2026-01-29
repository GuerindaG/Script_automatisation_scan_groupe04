#!/bin/bash

URL="http://localhost/DVWA"
WORDLIST="/usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt"
EXTENSIONS="php,txt,html"
OUTPUT="Scan.txt"

echo "[+] Scan Gobuster en cours sur $URL"
echo "[+] Résultats sauvegardés dans $OUTPUT"

gobuster dir \
-u $URL \
-w $WORDLIST \
-x $EXTENSIONS \
-q \
-o $OUTPUT \

echo "Scan terminé"
