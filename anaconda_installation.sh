# Reference: https://docs.anaconda.com/anaconda/install/linux/ (Official Guide)
# Reference : https://linuxize.com/post/how-to-install-anaconda-on-ubuntu-20-04/

# Author: Mano Vishnu (geekymano@gmail.com)
# Last Updated: 2022/12/27

# command to execute: bash anaconda_installation.sh <path_to_execute_setup_file>

echo '-------------------------------------- Prerequisites for Installing Anaconda --------------------------------------'
sudo apt update -y;
sudo apt full-upgrade -y;
sudo apt autoremove -y;
sudo apt clean -y;

echo '----------------------- Installing Anaconda Navigator Dependencies -----------------------------'
sudo apt install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6

echo '----------------------- Downloading Anaconda Setup file -----------------------------'
wget -P $1 https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh

echo '----------------------- Verifying Anaconda Setup file -----------------------------'
sha256sum $1/Anaconda3-2020.02-Linux-x86_64.sh

echo '----------------------- Executing Anaconda Setup file -----------------------------'
bash $1/Anaconda3-2020.02-Linux-x86_64.sh

echo '----------------------- Updating bashrc file & Starting anaconda-navigator'
source ~/.bashrc
anaconda-navigator
