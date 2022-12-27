echo '-------------------------------------- Prerequisites for Installing Anaconda --------------------------------------'
sudo apt update ;
sudo apt full-upgrade -y;
sudo apt autoremove;
sudo apt clean;

echo '----------------------- Installing Anaconda Navigator Dependencies -----------------------------'
sudo apt install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6

echo '----------------------- Downloading Anaconda Setup file -----------------------------'
wget -P <path_to_save_file> https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh

echo '----------------------- Verifying Anaconda Setup file -----------------------------'
sha256sum <path_to_saved_file>/Anaconda3-2020.02-Linux-x86_64.sh

echo '----------------------- Executing Anaconda Setup file -----------------------------'
bash <path_to_saved_file>/Anaconda3-2020.02-Linux-x86_64.sh

source ~/.bashrc
anaconda-navigator

# Replace <path_to_saved_file> with . to download the file to current directory
# Reference: https://docs.anaconda.com/anaconda/install/linux/ (Official Guide)
# Reference : https://linuxize.com/post/how-to-install-anaconda-on-ubuntu-20-04/
