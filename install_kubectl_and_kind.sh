#!/bin/bash

# Determine the architecture
ARCH=$(uname -m)
if [[ "$ARCH" == "x86_64" ]]; then
  ARCH="amd64"
elif [[ "$ARCH" == "i386" ]]; then
  ARCH="386"
else
  echo "Unsupported architecture: $ARCH"
  exit 1
fi

# Install kubectl

# Download kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/${ARCH}/kubectl"

# Make kubectl executable
chmod +x ./kubectl

# Move kubectl to your PATH
sudo mv ./kubectl /usr/local/bin/kubectl

# Test the installation
kubectl version --client

echo "kubectl has been installed successfully."

# Install kind

# Download kind
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.11.1/kind-linux-${ARCH}

# Make kind executable
chmod +x ./kind

# Move kind to your PATH
sudo mv ./kind /usr/local/bin/kind

# Test the installation
kind version

echo "kind has been installed successfully."
