#!/bin/bash

LOCAL_DIR="/path/to/local/dir"
S3_bucket="s3://your-bucket-name"
timestamp=$(date +%y-%m-%d_%H%M%S)
backupdir_name_s3="backup_$timestamp"

if ! command -v aws &> /dev/null; then
    echo "AWS CLI is not installed. Please install it."
    exit 1
fi
echo "Woooho aws cli is installed , Now let's process it futher "


if ! -d "$LOCAL_DIR"; then
    echo "Error: local dir not found at given $LOCAL_DIR path" 
    exit 1
fi

