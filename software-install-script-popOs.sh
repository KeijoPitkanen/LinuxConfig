declare -A packages=(
  [bleachbit]="system cleaner"
  [calcurse]="terminal calendar"
  [fzf]="fuzzy finder"
  [gedit]="text editor"
  [gnome]="desktop environment"
  [kitty]="terminal emulator"
  [krita]="digital painting software"
  [obs - studio]="streaming and recording software"
  [qbittorrent]="torrent client"
  [ranger]="terminal file browser"
  [speedcrunch]="calculator"
  [steam]="video game platform"
  [sway]="window mangager"
  [thunderbird]="email client"
  [vlc]="media player"
  [w3m]="3w3 for picture previews inside ranger"
)

declare -A flatpaks=(
  [spotify]="web music player"
  [telegram]="messaging app"
  [waterfox]="web browser"
  [missioncenter]="system monitor"
)

echo Updating Packages
sudo apt update
sudo apt upgrade

read -p "Do you want to install Fastfetch from the PPA? (y/n): " choice
if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
  echo "Adding Fastfetch PPA and installing..."
  sudo add-apt-repository ppa:zhangsongcui3371/fastfetch
  sudo apt update
  sudo apt install -y fastfetch
  echo "Fastfetch installation complete!"
else
  echo "Fastfetch installation skipped."
fi

read -p "Do you want to install Neovim from source? (y/n): " choice
if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
  echo "Building Neovim from source..."
  sudo apt-get update
  sudo apt-get install -y ninja-build gettext cmake curl build-essential
  git clone https://github.com/neovim/neovim
  cd neovim || exit
  git checkout stable
  make CMAKE_BUILD_TYPE=RelWithDebInfo
  sudo make install
  echo "Neovim installation complete!"
else
  echo "Neovim installation skipped."
fi

echo "Installing packages"
for pkg in "${!packages[@]}"; do
  echo
  read -p "Install $pkg: ${packages[$pkg]}? (y/n) " answer
  if [[ "$answer" == [Yy] ]]; then
    sudo apt install --yes "$pkg"
  else
    echo "Skipping $pkg"
  fi
done

echo "Installing Flatpak apps"
for app in "${!flatpaks[@]}"; do
  echo
  read -p "Install $app: ${flatpaks[$app]}? (y/n) " answer
  if [[ "$answer" == [Yy] ]]; then
    flatpak install -y flathub "$app"
  else
    echo "Skipping $app"
  fi
done

echo Software installed
echo ending script
