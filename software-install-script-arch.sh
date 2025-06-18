declare -A packages=(
  [bleachbit]="system cleaner"
  [calcurse]="terminal calendar"
  [fastfetch]="terminal system info tool"
  [fzf]="fuzzy finder"
  [gedit]="text editor"
  [gnome]="desktop environment"
  [jellyfin - server]="media server"
  [jellyfin - web]="media server web interface"
  [kitty]="terminal emulator"
  [krita]="digital painting software"
  [neovim]="text editor"
  [obs - studio]="streaming and recording software"
  [qbittorrent]="torrent client"
  [ranger]="terminal file browser"
  [speedcrunch]="calculator"
  [spotify - launcher]="web music player"
  [steam]="video game platform"
  [sway]="window mangager"
  [telegram - desktop]="messaging app"
  [thunderbird]="email client"
  [vlc]="media player"
  [w3m]="3w3 for picture previews inside ranger"
)

declare -A yay_packages=(
  [mission - center]="system monitor utility"
  [onlyoffice - bin]="office suite"
  [popsicle]="USB flashing tool"
  [vscodium]="open-source Visual Studio Code alternative"
  [waterfox - bin]="privacy-focused web browser"
  [whatsie]="WhatsApp desktop client"
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
