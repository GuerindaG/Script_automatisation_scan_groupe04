# Script_automatisation_scan

Ce dépôt regroupe quatre outils essentiels pour automatiser la reconnaissance réseau et web. Chaque script est optimisé pour fournir un résultat clair, sans informations superflues.

## 1. Scan de Ports Rapide (nmap_script.sh)
Ce script automatise la découverte des ports ouverts sur une machine cible comme Kioptrix. Il demande l'adresse IP à l'utilisateur pour une flexibilité totale. Le résultat final affiche uniquement une liste de ports séparés par des virgules.

## 2. Gobuster Fichiers Cachés (gobuster_script.sh)
Cet outil liste les répertoires et fichiers cachés d'un serveur web de manière minimaliste. Il supprime toute la bannière publicitaire et les logs de chargement pour ne garder que les chemins trouvés. C'est le script idéal pour obtenir une vue rapide et propre de l'arborescence.

## 3. Gobuster Spécial DVWA (script_dvwa_buster_dvwa.sh)
Ce script est pré-configuré spécifiquement pour l'environnement Damn Vulnerable Web App (DVWA). Il utilise des paramètres optimisés pour cibler les dossiers sensibles de cette application vulnérable. L'affichage est filtré pour ne montrer que les succès de scan (codes 200 et 301).

## 4. Scanner Multi-Outils Pro (script_buster.sh)
Il s'agit d'une version avancée proposant un menu interactif entre Gobuster et Feroxbuster. Le script intègre des contrôles de sécurité pour valider le format de l'URL et empêcher les erreurs de saisie. Il nettoie automatiquement les résultats pour offrir une interface de lecture professionnelle.

## 5. Installation

### Donner les droits d'exécution à tous les scripts
chmod +x *.sh

### Exemple d'utilisation
./nmap_script.sh
