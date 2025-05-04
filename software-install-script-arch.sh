echo Updating Pacman
sudo pacman -Syyu

echo Installing yay
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
yay --version

echo installing tools from pacman
echo installing 3w3 for picture previews inside ranger
echo installing bleachbit system cleaner
echo installing fzf fuzzy finder
echo installing gedit text editor
echo installing jellyfin-server media server
echo installing jellyfin-web media server web interface
echo installing kitty terminal emulator
echo installing krita digital painting software
echo installing neovim text editor
echo installing nwg-hello greetd greeter
echo installing obs-studio streaming and recording software
echo installing qbittorrent torrent client
echo installing ranger terminal file browser
echo installing speedcrunch calculator
echo installing steam video game platform
echo installing telegram-desktop messaging app
echo installing thunderbird email client
echo installing vlc media player
sudo pacman -S bleachbit fzf gedit greetd jellyfin-server jellyfin-web kitty krita neovim nwg-hello obs-studio qbittorrent ranger speedcrunch steam telegram-desktop thunderbird vlc w3w

echo switching to use greetd login manager
sudo pacman systemctl enable greetd.service

echo installing tools from yay
yay -S vscodium mission-center popsicle whatsie waterfox-bin

echo Software installed
echo -e "\n please remember to copy the greetd config file to /etc/greetd/ \n"
echo ending script
