declare -A packages=(
  [bleachbit]="system cleaner"
  [calcurse]="terminal calendar"
  [clamav]="Anti virus software"
  [fastfetch]="terminal system info tool"
  [fzf]="fuzzy finder"
  [gedit]="text editor"
  [discord]="communication platform"
  [gnome]="desktop environment"
  [jellyfin - web]="media server web interface"
  [kitty]="terminal emulator"
  [krita]="digital painting software"
  [neovim]="text editor"
  [nerd - fonts]="common special characters"
  [obs - studio]="streaming and recording software"
  [qbittorrent]="torrent client"
  [ranger]="terminal file browser"
  [speedcrunch]="calculator"
  [spotify - launcher]="web music player"
  [steam]="video game platform"
  [swaybg]="wallpaper handler for sway"
  [telegram - desktop]="messaging app"
  [thunderbird]="email client"
  [vlc]="media player"
  [w3m]="3w3 for picture previews inside ranger"
  [rofi]="application opener for sway"
  [playerctl]="terminal tool for sound control"
  [pulsemixer]="terminal mixer"
  [vlc - plugin - ffmpeg]="Adds support for different file formats for vlc"
  [wl - clipboard]="adds system clipboard compatability with neovim"
  [waybar]="bar for sway window mangager"
  [btop]="terminal system monitor"
  [rocm - smi - lib]="dependency for btop amd gpu monitoring"
)

declare -A yay_packages=(
  [mission - center]="system monitor utility"
  [onlyoffice - bin]="office suite"
  [popsicle]="USB flashing tool"
  [swayfx]="window mangager"
  [vscodium]="open-source Visual Studio Code alternative"
  [whatsie]="WhatsApp desktop client"
  [swaylock]="lock for sway window manager"
  [sway - screenshot]="screenshot tool for sway"
  [extension - manager]="3rd party software for installing gnome extenssions"
)

echo Updating Pacman
sudo pacman -Syyu

read -p "Do you want to install yay AUR helper? (y/n) " response
if [[ "$response" == [Yy] ]]; then
  echo "Installing yay..."
  sudo pacman -S --needed base-devel git
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si
  yay --version
else
  echo "Skipped yay installation."
fi

echo "Installing tools from pacman..."
for pkg in "${!packages[@]}"; do
  echo
  read -p "Install $pkg: ${packages[$pkg]}? (y/n) " answer
  if [[ "$answer" == [Yy] ]]; then
    sudo pacman -S --noconfirm "$pkg"
  else
    echo "Skipping $pkg"
  fi
done

echo "Installing tools from yay..."
for pkg in "${!yay_packages[@]}"; do
  echo
  read -p "Install $pkg: ${yay_packages[$pkg]}? (y/n) " answer
  if [[ "$answer" == [Yy] ]]; then
    yay -S --noconfirm "$pkg"
  else
    echo "Skipping $pkg"
  fi
done

echo Software installed
echo ending script
