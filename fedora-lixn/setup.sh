#!/usr/bin/env bash
set -e

echo "=== Configurando Fedora (RPM Fusion, Códecs y Flatpak) ==="

# 1. Habilitar RPM Fusion (Free y Nonfree)
sudo dnf install -y \
  https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$\(rpm -E %fedora).noarch.rpm \
  https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$\(rpm -E %fedora).noarch.rpm

# 2. Instalar códecs multimedia completos y aceleración por hardware AMD
sudo dnf install -y @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf install -y mesa-va-drivers-freeworld libva-utils

# 3. Configurar Flathub y limpiar fuentes duplicadas
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sudo flatpak remote-delete fedora 2>/dev/null || true
sudo rm -f /etc/flatpak/remotes.d/fedora*.flatpakrepo

# 4. Copiar dotfiles al Home del usuario
cp -f .zshrc ~/
cp -f .p10k.zsh ~/ 2>/dev/null || true
mkdir -p ~/.config/kitty ~/.config/fastfetch
cp -rf .config/kitty/* ~/.config/kitty/ 2>/dev/null || true
cp -rf .config/fastfetch/* ~/.config/fastfetch/ 2>/dev/null || true

echo "=== Listo. Reiniciá la sesión para aplicar todos los cambios ==="
