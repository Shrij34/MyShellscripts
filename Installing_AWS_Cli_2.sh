#!/bin/bash

# Check if AWS CLI v2 is installed
if aws --version 2>/dev/null | grep -q 'aws-cli/2'; then
    echo "AWS CLI v2 is installed"
else
    echo "Installing AWS CLI v2"

    # Download AWS CLI v2
    echo "Downloading AWS CLI v2"
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

    # Install unzip if not already installed
    if ! command -v unzip &> /dev/null; then
        echo "Installing unzip"
        sudo apt update
        sudo apt install -y unzip
    fi

    # Unzip the downloaded file
    echo "Unzipping AWS CLI v2"
    unzip awscliv2.zip

    # Install AWS CLI v2
    echo "Installing AWS CLI v2"
    sudo ./aws/install

    # Clean up the downloaded files and unzipped folder
    echo "Cleaning up"
    rm -rf awscliv2.zip aws

    # Verify the installation
    echo "Installation complete"
    aws --version
fi
