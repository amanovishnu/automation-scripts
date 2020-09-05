echo '--------------------------------------INSTALLING ANACONDA --------------------------------------'
sudo apt update ; 
sudo apt full-upgrade -y;
sudo apt autoremove;
sudo apt clean;


echo '----------------------- INSTALLING ANACONDA NAVIGATOR DEPENDENCIES -----------------------------'
sudo apt install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6



echo '----------------------- DOWNLOADING ANACONDA INSTALLATION SCRIPT -----------------------------'
wget -P /home/itspe/Desktop https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh


echo '----------------------- VERIFYING ANACONDA INSTALLATION SCRIPT -----------------------------'
sha256sum /home/itspe/Desktop/Anaconda3-2020.02-Linux-x86_64.sh


echo '----------------------- INSTALLING ANACONDA INSTALLATION SCRIPT -----------------------------'
bash /home/itspe/Desktop/Anaconda3-2020.02-Linux-x86_64.sh



source ~/.bashrc
anaconda-navigator


# Reference : https://linuxize.com/post/how-to-install-anaconda-on-ubuntu-20-04/
