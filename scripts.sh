echo '================= sudo apt update; ================'
sudo apt update -y;


echo '================= sudo apt full-upgrade; ================'
sudo apt full-upgrade -y;


echo '============== sudo apt clean; ==================='
sudo apt clean -y;


echo '============= sudo apt autoremove; ===================='
sudo apt autoremove -y;


echo '============== sudo apt install git ==================='
sudo apt install git;


echo '============== INSTALLING BRAVE BROWSER ==================='
sudo apt install apt-transport-https curl
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update -y
sudo apt install brave-browser -y


echo '============== INSTALLING GUAKE TERMINAL ==================='
sudo apt-get update -y
sudo apt-get install guake -y
guake --version


echo '============== INSTALLING SYNAPSE ==================='
sudo apt-get install synapse


echo '============== INSTALLING VISUAL STUIO CODE ==================='
sudo apt update -y
sudo apt install software-properties-common apt-transport-https wget
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update -y
sudo apt install code
sudo apt update -y
sudo apt upgrade -y


echo '============== INSTALLING POSTMAN ==================='
sudo apt install snapd -y
sudo snap install postman


echo '============== INSTALLING VLC MEDIA PLAYER ==================='
sudo snap install vlc


echo '============== INSTALLING GNOME TWEAK TOOL ==================='
sudo add-apt-repository universe
sudo apt install gnome-tweak-tool -y


