#!/bin/bash


read -p "Entrez l'adresse IP de la cible (ex: 192.168.1.10) : " IP

if [[ -z "$IP" ]]; then
    echo "[!] Erreur : Vous devez entrer une adresse IP."
    exit 1
fi

echo -n "Les ports ouverts sont : "

# nmap scanne tous les ports (-p-)
# grep récupère les lignes commençant par un chiffre
# cut extrait le numéro du port avant le "/"
# tr remplace les retours à la ligne par des virgules
# sed supprime la virgule finale inutile
nmap -p- --min-rate 1000 "$IP" | grep ^[0-9] | cut -d'/' -f1 | tr '\n' ',' | sed 's/,$//'

echo "" # Pour un retour à la ligne propre à la fin
