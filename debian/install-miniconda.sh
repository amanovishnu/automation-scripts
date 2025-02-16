#!/bin/bash

# Reference: https://docs.conda.io/en/latest/miniconda.html (Official Guide)
# Author: MANOVISHNU ADEPU (geekymano@gmail.com)
# Last Updated: 2025/02/16

# Usage: bash install-miniconda.sh [path_to_download_setup_file]
# If no path is provided, the current working directory (pwd) will be used as the default.

# Check if a download path is provided, otherwise use the current working directory
if [ -z "$1" ]; then
    echo "No download path provided. Using the current working directory."
    DOWNLOAD_PATH=$(pwd)
else
    DOWNLOAD_PATH=$1
fi

MINICONDA_URL="https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh"
MINICONDA_INSTALLER="$DOWNLOAD_PATH/$(basename $MINICONDA_URL)"

echo '-------------------------------------- Prerequisites for Installing Miniconda --------------------------------------'
sudo apt update -y
sudo apt full-upgrade -y
sudo apt autoremove -y
sudo apt clean -y

echo '----------------------- Installing Miniconda Dependencies [Optional] -----------------------------'
sudo apt install -y libgl1-mesa-glx libegl1-mesa libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6

echo '----------------------- Downloading Miniconda Setup file -----------------------------'
wget -P "$DOWNLOAD_PATH" "$MINICONDA_URL"

echo '----------------------- Verifying Miniconda Setup file -----------------------------'
sha256sum "$MINICONDA_INSTALLER"

echo '----------------------- Executing Miniconda Setup file -----------------------------'
bash "$MINICONDA_INSTALLER"

echo '----------------------- Updating bashrc file -----------------------------'
source ~/.bashrc

echo 'Installation complete. Please restart your terminal or run `source ~/.bashrc` to initialize Miniconda.'