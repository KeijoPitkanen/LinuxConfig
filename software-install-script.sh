echo Updating Pacman
sudo pacman -Syu
echo Installing yay
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
yay --version
echo Yay install successful
echo installing tools from pacman
sudo pacman -S steam thunderbird vlc telegram-desktop bleachbit kitty neovim gedit jellyfin-server jellyfin-web krita obs-studio qbittorrent speedcrunch 
yay -S vscodium mission-center popsicle whatsie waterfox-bin
echo Software installed
