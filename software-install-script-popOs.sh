#!/usr/bin/env bash

declare -A packages=(
  [bleachbit]="system cleaner"
  [calcurse]="terminal calendar"
  [fzf]="fuzzy finder"
  [gedit]="text editor"
  [kitty]="terminal emulator"
  [krita]="digital painting software"
  [obs-studio]="streaming and recording software"
  [qbittorrent]="torrent client"
  [ranger]="terminal file browser"
  [speedcrunch]="calculator"
  [steam]="video game platform"
  [thunderbird]="email client"
  [vlc]="media player"
  [w3m]="web browser for picture previews inside ranger"
)

declare -A desktop_environments=(
  [gnome]="desktop environment"
  [sway]="window manager"
  [kde-standard]="Plasma desktop environment"
)

declare -A flatpaks=(
  [spotify]="web music player"
  [telegram]="messaging app"
  [waterfox]="web browser"
  [missioncenter]="system monitor"
  [onlyoffices]="office suite"
)

echo "Updating packages..."
sudo apt update
sudo apt upgrade -y

echo

read -p "Do you want to install Fastfetch from the PPA? (y/n): " choice
if [[ "$choice" =~ ^[Yy]$ ]]; then
  echo "Adding Fastfetch PPA and installing..."
  sudo add-apt-repository -y ppa:zhangsongcui3371/fastfetch
  sudo apt update
  sudo apt install -y fastfetch
  echo "Fastfetch installation complete!"
else
  echo "Fastfetch installation skipped."
fi

echo

read -p "Do you want to install Neovim from source? (y/n): " choice
if [[ "$choice" =~ ^[Yy]$ ]]; then
  echo "Building Neovim from source..."

  sudo apt update
  sudo apt install -y ninja-build gettext cmake curl build-essential git

  git clone https://github.com/neovim/neovim.git

  cd neovim || exit 1
  git checkout stable

  make CMAKE_BUILD_TYPE=RelWithDebInfo

  sudo make install

  cd ..

  echo "Neovim installation complete!"
else
  echo "Neovim installation skipped."
fi

echo

read -p "Do you want to install a desktop environment? (y/n): " choice
if [[ "$choice" =~ ^[Yy]$ ]]; then
  echo "Desktop environments available:"

  for de in "${!desktop_environments[@]}"; do
    echo
    read -p "Install $de: ${desktop_environments[$de]}? (y/n): " answer

    if [[ "$answer" =~ ^[Yy]$ ]]; then
      sudo apt install -y "$de"
    else
      echo "Skipping $de"
    fi
  done
else
  echo "Desktop environment installation skipped."
fi

echo
echo "Installing packages..."

for pkg in "${!packages[@]}"; do
  echo
  read -p "Install $pkg: ${packages[$pkg]}? (y/n): " answer

  if [[ "$answer" =~ ^[Yy]$ ]]; then
    sudo apt install -y "$pkg"
  else
    echo "Skipping $pkg"
  fi
done

echo
echo "Installing Flatpak apps..."

for app in "${!flatpaks[@]}"; do
  echo
  read -p "Install $app: ${flatpaks[$app]}? (y/n): " answer

  if [[ "$answer" =~ ^[Yy]$ ]]; then
    flatpak install -y flathub "$app"
  else
    echo "Skipping $app"
  fi
done

echo
echo "Removing unused default applications..."

sudo apt purge -y \
  geary \
  libreoffice-core \
  libreoffice-base-core \
  libreoffice-common \
  totem \
  seahorse \
  foot

sudo apt autoremove -y

echo
echo "Software installation complete."
echo "Script finished."
