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
echo installing obs-studio streaming and recording software
echo installing qbittorrent torrent client
echo installing ranger terminal file browser
echo installing speedcrunch calculator
echo installing steam video game platform
echo installing telegram-desktop messaging app
echo installing thunderbird email client
echo installing vlc media player
echo installing spotify-launcher web music player
echo installing fastfetch terminal system info tool
sudo pacman -S fastfetch spotify-launcher bleachbit fzf gedit greetd jellyfin-server jellyfin-web kitty krita neovim obs-studio qbittorrent ranger speedcrunch steam telegram-desktop thunderbird vlc w3w

echo installing tools from yay
yay -S vscodium mission-center popsicle whatsie waterfox-bin

echo Software installed
echo ending script
