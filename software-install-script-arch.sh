echo Updating Pacman
sudo pacman -Syyu

echo Installing yay
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
yay --version
echo Yay install successful

echo installing tools from pacman
echo installing 3w3 for picture previews inside ranger
echo installing ranger terminal file browser
echo installing steam video game platform
echo installing fzf fuzzy finder
echo installing thunderbird email client
echo installing vlc media player
echo installing telegram-desktop messaging app
echo installing bleachbit system cleaner
echo installing kitty terminal emulator
echo installing neovim text editor
echo installing gedit text editor
echo installing jellyfin-server media server
echo installing jellyfin-web media server web interface
echo installing krita digital painting software
echo installing obs-studio streaming and recording software
echo installing qbittorrent torrent client
echo installing speedcrunch calculator
sudo pacman -S w3w ranger steam fzf thunderbird vlc telegram-desktop bleachbit kitty neovim gedit jellyfin-server jellyfin-web krita obs-studio qbittorrent speedcrunch
echo tools from pacman installed successfully

echo installing tools from yay
yay -S vscodium mission-center popsicle whatsie waterfox-bin
echo tools from yay installed successfully

echo Software installed
echo ending script
