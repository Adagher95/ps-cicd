#!/bin/bash

# Exit on any error
set -e

# Define your username (replace with your actual username if different)
USERNAME="adagher"

echo ">>> Removing old versions of Docker..."
sudo apt-get remove -y docker docker-engine docker.io containerd runc || true

echo ">>> Updating package index..."
sudo apt-get update

echo ">>> Installing prerequisites..."
sudo apt-get install -y ca-certificates curl gnupg lsb-release

echo ">>> Adding Docker GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo ">>> Setting up Docker repository..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] \
  https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo ">>> Updating package index with Docker repo..."
sudo apt-get update --allow-unauthenticated --allow-insecure-repositories

echo ">>> Installing Docker Engine..."
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

echo ">>> Verifying Docker installation..."
sudo docker --version
sudo docker info

echo ">>> Adding user '$USERNAME' to docker group..."
sudo usermod -aG docker "$USERNAME"

echo ">>> Current groups for user $USERNAME:"
groups "$USERNAME"
newgrp
echo ">>> Script complete. You may need to log out and back in for group changes to take effect."

# chmod +x install_docker.sh
# ./install_docker.sh
