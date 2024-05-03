#!/bin/bash

# Vérification des privilèges root
if [ "$EUID" -ne 0 ]; then
  echo "Ce script doit être exécuté en tant que root"
  exit 1
fi

# Purge du paquet cloud-init
echo "Purge du paquet cloud-init..."
apt purge -y cloud-init

# Force remove cloud-init
rm -r /etc/cloud/*

# Mise à jour des paquets
echo "Mise à jour des paquets..."
apt update && apt dist-upgrade -y

# Clear des paquets
apt autoremove -y

# Remove script
rm -r /home/autovms/

# Notification de la fin de l'opération
echo "La mise à jour des paquets est terminée."

# Clear history
history -c
