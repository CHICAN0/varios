#!/bin/bash

# Actualiza los paquetes existentes
sudo apt update

# Instala dependencias necesarias para añadir repositorios vía HTTPS
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Descarga la clave GPG oficial de Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Añade el repositorio de Docker a las fuentes de apt
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Actualiza los paquetes con los nuevos repositorios de Docker
sudo apt update

# Instala Docker Community Edition
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Añade tu usuario al grupo "docker" para ejecutar comandos Docker sin sudo
sudo usermod -aG docker $USER

# Descarga la última versión de Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Aplica permisos de ejecución al binario de Docker Compose
sudo chmod +x /usr/local/bin/docker-compose

# Crea un enlace simbólico al binario de Docker Compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# Muestra las versiones de Docker y Docker Compose instaladas
echo "Docker version:"
docker --version

echo "Docker Compose version:"
docker-compose --version

echo "agregar usuario a sudoers"
sudo usermod -aG docker $USER

echo "debes salir y volver a ingresar a la terminal para que usermod tenga el efecto deseado"
