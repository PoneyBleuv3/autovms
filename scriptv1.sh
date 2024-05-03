#!/bin/bash

# Vérification des privilèges root
if [ "$EUID" -ne 0 ]
  then echo "Ce script doit être exécuté en tant que root"
  exit
fi

# Mise à jour des paquets
apt update

# Notification de la fin de l'opération
echo "La mise à jour des paquets est terminée."
