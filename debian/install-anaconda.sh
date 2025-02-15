#!/bin/bash

# Reference: https://docs.anaconda.com/anaconda/install/linux/ (Official Guide)
# Author: MANOVISHNU ADEPU (geekymano@gmail.com)
# Last Updated: 2025/02/15

# Usage: bash install-anaconda.sh [path_to_download_setup_file]
# If no path is provided, the current working directory (pwd) will be used as the default.

# Check if a download path is provided, otherwise use the current working directory
if [ -z "$1" ]; then
    echo "No download path provided. Using the current working directory."
    DOWNLOAD_PATH=$(pwd)
else
    DOWNLOAD_PATH=$1
fi

ANACONDA_URL="https://repo.anaconda.com/archive/Anaconda3-2024.10-1-Linux-x86_64.sh"
ANACONDA_INSTALLER="$DOWNLOAD_PATH/$(basename $ANACONDA_URL)"

echo '-------------------------------------- Prerequisites for Installing Anaconda --------------------------------------'
sudo apt update -y
sudo apt full-upgrade -y
sudo apt autoremove -y
sudo apt clean -y

echo '----------------------- Installing Anaconda Navigator Dependencies -----------------------------'
sudo apt install -y libgl1-mesa-glx libegl1-mesa libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6

echo '----------------------- Downloading Anaconda Setup file -----------------------------'
wget -P "$DOWNLOAD_PATH" "$ANACONDA_URL"

echo '----------------------- Verifying Anaconda Setup file -----------------------------'
sha256sum "$ANACONDA_INSTALLER"

echo '----------------------- Executing Anaconda Setup file -----------------------------'
bash "$ANACONDA_INSTALLER"

echo '----------------------- Updating bashrc file -----------------------------'
source ~/.bashrc

echo 'Installation complete. Please restart your terminal or run `source ~/.bashrc` to initialize Anaconda.'
