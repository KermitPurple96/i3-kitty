#!/usr/bin/env bash
# =============================================================================
# Fedora 43 adaptation of https://github.com/KermitPurple96/i3-kitty config.sh
# Original: Kali/Debian pentesting i3+kitty setup by KermitPurple96
#
# Run as: sudo ./config-fedora.sh
# =============================================================================
set -euo pipefail

if [ -z "${SUDO_USER:-}" ]; then
    echo "ERROR: Run this script with sudo, e.g.: sudo ./config-fedora.sh"
    exit 1
fi

USER_HOME="/home/$SUDO_USER"
cd "$USER_HOME"

dnf update -y

# BUILD TOOLS & CORE DEPS (install FIRST)
dnf install -y \
    meson ninja-build autoconf automake gcc gcc-c++ make cmake clang lldb \
    python3-pip python3-devel pipx \
    git wget curl unzip tar pkg-config

# XCB / I3 BUILD DEPENDENCIES
dnf install -y \
    startup-notification-devel libxcb-devel xcb-util-devel xcb-util-xrm-devel \
    xcb-util-keysyms-devel xcb-util-wm-devel xcb-util-cursor-devel \
    xcb-util-renderutil-devel xcb-util-image-devel \
    libxkbcommon-devel libxkbcommon-x11-devel yajl-devel pcre2-devel \
    cairo-devel pango-devel libev-devel libXfixes-devel

# ── KALI-CLEAN REPLACEMENT (Fedora native) ──────────────────────────────────
# The original kali-clean/install.sh is 100% Debian. We replicate its purpose:
# install i3, fonts, pywal, rofi, picom, copy configs.

dnf install -y \
    i3 i3blocks i3status i3lock rofi picom feh arandr flameshot \
    arc-theme papirus-icon-theme lxappearance thunar unclutter cargo ImageMagick \
    xorg-x11-server-Xorg xorg-x11-xinit xorg-x11-drv-libinput

# Ensure i3 session file exists for GDM login screen
if [ ! -f /usr/share/xsessions/i3.desktop ]; then
    mkdir -p /usr/share/xsessions
    cat > /usr/share/xsessions/i3.desktop << 'XSEOF'
[Desktop Entry]
Name=i3
Comment=improved dynamic tiling window manager
Exec=i3
TryExec=i3
Type=Application
Keywords=tiling;wm;windowmanager;
XSEOF
fi

# IMPORTANT: Do NOT disable Wayland — GDM needs it to boot on Fedora.
# i3 runs as an X11 session alongside Wayland sessions.

# Fonts (Iosevka + RobotoMono — same as kali-clean)
mkdir -p "$USER_HOME/.local/share/fonts/"
wget -q https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Iosevka.zip -O /tmp/Iosevka.zip
wget -q https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/RobotoMono.zip -O /tmp/RobotoMono.zip
unzip -o /tmp/Iosevka.zip -d "$USER_HOME/.local/share/fonts/"
unzip -o /tmp/RobotoMono.zip -d "$USER_HOME/.local/share/fonts/"
rm -f /tmp/Iosevka.zip /tmp/RobotoMono.zip
fc-cache -fv

pip3 install pywal --break-system-packages

# Pull kali-clean CONFIGS only (not install.sh)
git clone https://github.com/xct/kali-clean /tmp/kali-clean 2>/dev/null || true
mkdir -p "$USER_HOME/.config/i3" "$USER_HOME/.config/compton" "$USER_HOME/.config/rofi"
cp /tmp/kali-clean/.config/i3/config "$USER_HOME/.config/i3/config" 2>/dev/null || true
cp /tmp/kali-clean/.config/i3/i3blocks.conf "$USER_HOME/.config/i3/i3blocks.conf" 2>/dev/null || true
cp /tmp/kali-clean/.config/i3/clipboard_fix.sh "$USER_HOME/.config/i3/clipboard_fix.sh" 2>/dev/null || true
cp /tmp/kali-clean/.config/compton/compton.conf "$USER_HOME/.config/compton/compton.conf" 2>/dev/null || true
cp /tmp/kali-clean/.config/rofi/config "$USER_HOME/.config/rofi/config" 2>/dev/null || true
cp /tmp/kali-clean/.fehbg "$USER_HOME/.fehbg" 2>/dev/null || true
cp -r /tmp/kali-clean/.wallpaper "$USER_HOME/.wallpaper" 2>/dev/null || true
rm -rf /tmp/kali-clean
echo "kali-clean configs applied (Fedora-adapted)"

# ── CORE PACKAGES ────────────────────────────────────────────────────────────
dnf install -y \
    openldap-devel openssl-devel cyrus-sasl-devel \
    net-snmp net-snmp-utils ncdu proxychains-ng ripgrep nmap ncat \
    smbclient sslscan kitty cryptsetup steghide traceroute hping3 \
    zsh remmina keepassxc coreutils moreutils xclip ftp rdesktop jq \
    rlwrap ipcalc xsltproc ghex hexedit golang npm nodejs gh \
    putty ruby-devel rubygems dmenu xsel xdotool \
    krb5-workstation krb5-devel grc scrub whois tmux fish \
    docker docker-compose fontawesome-fonts httpd lolcat \
    --skip-unavailable || true

# ── CLIPMENU ─────────────────────────────────────────────────────────────────
git clone https://github.com/cdown/clipmenu.git /tmp/clipmenu
cd /tmp/clipmenu && make clean && make && sudo make install
cd "$USER_HOME" && rm -rf /tmp/clipmenu
sudo -u "$SUDO_USER" systemctl --user daemon-reexec 2>/dev/null || true
sudo -u "$SUDO_USER" systemctl --user daemon-reload 2>/dev/null || true
sudo -u "$SUDO_USER" systemctl --user enable --now clipmenud.service 2>/dev/null || true

# ── UV ───────────────────────────────────────────────────────────────────────
curl -LsSf https://astral.sh/uv/install.sh | sh

# ── NPM GLOBAL ───────────────────────────────────────────────────────────────
npm -g install js-beautify
npm install -g pyright
npm install -g vscode-langservers-extracted

# ── GO TOOLS ─────────────────────────────────────────────────────────────────
export GOPATH="$USER_HOME/go"
export PATH="$PATH:$GOPATH/bin"
sudo -u "$SUDO_USER" bash -c "export GOPATH=$USER_HOME/go && go install github.com/jesseduffield/lazygit@latest"
sudo -u "$SUDO_USER" bash -c "export GOPATH=$USER_HOME/go && go install github.com/ffuf/ffuf/v2@latest"
sudo -u "$SUDO_USER" bash -c "export GOPATH=$USER_HOME/go && go install github.com/OJ/gobuster/v3@latest"

# ── INCURSORE ────────────────────────────────────────────────────────────────
git clone https://github.com/wirzka/incursore.git "$USER_HOME/incursore" 2>/dev/null || true
ln -sf "$USER_HOME/incursore/incursore.sh" /usr/local/bin/incursore

# ── ATUIN ────────────────────────────────────────────────────────────────────
curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh || true
cp /root/.atuin/bin/atuin /usr/bin/atuin 2>/dev/null || true
chown "$SUDO_USER:$SUDO_USER" /usr/bin/atuin 2>/dev/null || true

# ── USER TOOLS & SCRIPTS ────────────────────────────────────────────────────
mkdir -p "$USER_HOME/tools"
wget -q https://raw.githubusercontent.com/KermitPurple96/scripts/main/Bash/tools.sh -O "$USER_HOME/tools/tools.sh"

mkdir -p "$USER_HOME/dev/python"
git clone https://github.com/KermitPurple96/Shellpy "$USER_HOME/dev/python/shellpy" 2>/dev/null || true
git clone https://github.com/KermitPurple96/OSCP-PythonSupportTools "$USER_HOME/dev/python/support" 2>/dev/null || true
wget -q https://raw.githubusercontent.com/KermitPurple96/scripts/main/Python/md4.py -O "$USER_HOME/dev/python/md4"
wget -q https://raw.githubusercontent.com/mubix/IOXIDResolver/main/IOXIDResolver.py -O "$USER_HOME/dev/python/IOXIDResolver"
wget -q https://raw.githubusercontent.com/KermitPurple96/scripts/refs/heads/main/Python/look.py -O "$USER_HOME/dev/python/lookpy"
wget -q https://raw.githubusercontent.com/KermitPurple96/scripts/refs/heads/main/Python/ridbrute -O "$USER_HOME/dev/python/ridbrute"
wget -q https://raw.githubusercontent.com/KermitPurple96/scripts/refs/heads/main/Python/hex2sid -O "$USER_HOME/dev/python/hex2sid"
wget -q https://raw.githubusercontent.com/KermitPurple96/scripts/refs/heads/main/Python/shellListener.py -O "$USER_HOME/dev/python/shell"
wget -q https://raw.githubusercontent.com/sse-secure-systems/Active-Directory-Spotlights/refs/heads/master/AD-Trusts/krbTicketView.py -O "$USER_HOME/dev/python/TicketView"
chmod -R +x "$USER_HOME/dev/python/"*

mkdir -p "$USER_HOME/dev/go"
wget -q https://raw.githubusercontent.com/KermitPurple96/fastTCPscan/main/fastTCPscan.go -O "$USER_HOME/dev/go/fastTCPScan.go"
cd "$USER_HOME/dev/go"
go build -ldflags "-s -w" fastTCPScan.go 2>/dev/null && mv fastTCPScan /usr/bin/ || true
cd "$USER_HOME"

mkdir -p "$USER_HOME/Descargas/firefox" "$USER_HOME/maquinas" "$USER_HOME/.config/bin"
touch "$USER_HOME/.config/bin"/{name.txt,target.txt,ttl.txt,target_sys.txt}
chown "$SUDO_USER:$SUDO_USER" -R "$USER_HOME/.config/bin"

# ── LSD ──────────────────────────────────────────────────────────────────────
dnf install -y lsd 2>/dev/null || {
    wget -q "https://github.com/lsd-rs/lsd/releases/download/v1.1.5/lsd-v1.1.5-x86_64-unknown-linux-musl.tar.gz" -O /tmp/lsd.tar.gz
    tar xzf /tmp/lsd.tar.gz -C /tmp
    find /tmp -name lsd -type f -exec cp {} /usr/local/bin/lsd \;
    rm -rf /tmp/lsd*
}

# ── BAT ──────────────────────────────────────────────────────────────────────
dnf install -y bat 2>/dev/null || {
    wget -q "https://github.com/sharkdp/bat/releases/download/v0.24.0/bat-v0.24.0-x86_64-unknown-linux-musl.tar.gz" -O /tmp/bat.tar.gz
    tar xzf /tmp/bat.tar.gz -C /tmp
    find /tmp -name bat -type f -exec cp {} /usr/local/bin/bat \;
    rm -rf /tmp/bat*
}

# ── WALLPAPER (KermitPurple96's, overwrite kali-clean) ───────────────────────
rm -f "$USER_HOME/.fehbg"
wget -q https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/.fehbg -O "$USER_HOME/.fehbg"
mkdir -p "$USER_HOME/.wallpaper"
wget -q "https://github.com/KermitPurple96/i3-kitty/blob/main/fondo.jpg?raw=true" -O "$USER_HOME/.wallpaper/fondo.jpg"

# ── I3 CONFIG & I3BLOCKS (KermitPurple96's, overwrite kali-clean) ────────────
mkdir -p /usr/share/i3blocks
for f in target_sys.sh target.sh ethernet_status.sh access_point.sh session.sh; do
    wget -q "https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/usr/share/i3blocks/$f" -O "/usr/share/i3blocks/$f"
done
wget -q "https://raw.githubusercontent.com/KermitPurple96/i3-kitty/refs/heads/main/usr/share/i3blocks/vpn_status.sh" -O /usr/share/i3blocks/vpn_status.sh
echo 'eth0' > /usr/share/i3blocks/iface
chmod +x /usr/share/i3blocks/*
chown "$SUDO_USER:$SUDO_USER" /usr/share/i3blocks/*

mkdir -p "$USER_HOME/.config/i3"
wget -q https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/i3/i3blocks.conf -O "$USER_HOME/.config/i3/i3blocks.conf"
wget -q https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/i3/config -O "$USER_HOME/.config/i3/config"
wget -q https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/i3/clipboard_fix.sh -O "$USER_HOME/.config/i3/clipboard_fix.sh"
wget -q https://raw.githubusercontent.com/KermitPurple96/i3-kitty/refs/heads/main/i3/app-icons.json -O "$USER_HOME/.config/i3/app-icons.json"

# ── COMPTON/PICOM CONFIG ────────────────────────────────────────────────────
mkdir -p "$USER_HOME/.config/compton"
wget -q https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/compton/compton.conf -O "$USER_HOME/.config/compton/compton.conf"

# ── ROFI CONFIG ──────────────────────────────────────────────────────────────
mkdir -p "$USER_HOME/.config/rofi"
wget -q https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/rofi/config.rasi -O "$USER_HOME/.config/rofi/config.rasi"

# ── HACK NERD FONT ──────────────────────────────────────────────────────────
wget -q https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/Hack.zip -O /tmp/Hack.zip
mkdir -p /usr/local/share/fonts
unzip -o /tmp/Hack.zip -d /usr/local/share/fonts/
unzip -o /tmp/Hack.zip -d "$USER_HOME/.local/share/fonts/"
rm -f /tmp/Hack.zip
fc-cache -fv

# ── RUSTSCAN ─────────────────────────────────────────────────────────────────
wget -q https://github.com/RustScan/RustScan/releases/download/2.3.0/rustscan-2.3.0-x86_64-linux.zip -O /tmp/rustscan.zip
cd /tmp && unzip -o rustscan.zip
find /tmp -name 'rustscan' -type f -exec cp {} /usr/bin/rustscan \;
chmod +x /usr/bin/rustscan
cd "$USER_HOME"

# ── EVIL-WINRM ──────────────────────────────────────────────────────────────
gem install evil-winrm

# ── BLOODHOUND CE (Docker) ──────────────────────────────────────────────────
systemctl enable --now docker 2>/dev/null || true
mkdir -p /opt/bloodhound && cd /opt/bloodhound
curl -L https://ghst.ly/getbhce -o docker-compose.yml
docker-compose up -d 2>/dev/null || true
docker-compose logs bloodhound 2>/dev/null | grep 'Password' || true
cd "$USER_HOME"

# ── RED-TLDR ─────────────────────────────────────────────────────────────────
wget -q https://github.com/Rvn0xsy/red-tldr/releases/download/v0.4.3/red-tldr_0.4.3_linux_amd64.tar.gz -O /tmp/red-tldr.tar.gz
tar -zxf /tmp/red-tldr.tar.gz -C /usr/bin/
/usr/bin/red-tldr update 2>/dev/null || true
mv /usr/bin/red-tldr /usr/bin/red 2>/dev/null || true
rm -f /tmp/red-tldr.tar.gz

# ── ARSENAL ──────────────────────────────────────────────────────────────────
git clone https://github.com/Orange-Cyberdefense/arsenal.git /usr/bin/arsenal 2>/dev/null || true
cd /usr/bin/arsenal
python3 -m venv ars && source ars/bin/activate && pip install -r requirements.txt && deactivate
mkdir -p /usr/bin/arsenal/my_cheats
wget -q https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/arsenal/mycheats.md -O /usr/bin/arsenal/my_cheats/my_cheats.md
rm -f /usr/bin/arsenal/ars/bin/activate.fish
wget -q https://raw.githubusercontent.com/KermitPurple96/i3-kitty/refs/heads/main/arsenal/activate.fish -O /usr/bin/arsenal/ars/bin/activate.fish
cd "$USER_HOME"

# ── NEOVIM ───────────────────────────────────────────────────────────────────
wget -q https://github.com/neovim/neovim/releases/download/v0.11.2/nvim-linux-x86_64.appimage -O /usr/bin/nvim
chmod +x /usr/bin/nvim

sudo -u "$SUDO_USER" git clone https://github.com/NvChad/starter "$USER_HOME/.config/nvim" 2>/dev/null || true
chown "$SUDO_USER:$SUDO_USER" -R "$USER_HOME/.config/"
mkdir -p /root/.config/nvim/lua
cp -r "$USER_HOME/.config/nvim/"* /root/.config/nvim/ 2>/dev/null || true
wget -q https://raw.githubusercontent.com/KermitPurple96/i3-kitty/refs/heads/main/nvim/init.lua -O /root/.config/nvim/lua/init.lua

# ── SUBLIME TEXT (Fedora RPM repo) ──────────────────────────────────────────
rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg 2>/dev/null || true
cat > /etc/yum.repos.d/sublime-text.repo << 'SUBLEOF'
[sublime-text]
name=Sublime Text - x86_64 - Stable
baseurl=https://download.sublimetext.com/rpm/stable/x86_64
enabled=1
gpgcheck=1
gpgkey=https://download.sublimetext.com/sublimehq-rpm-pub.gpg
SUBLEOF
dnf install -y sublime-text 2>/dev/null || echo "WARN: Sublime Text install failed"

# ── KITTY CONFIG ─────────────────────────────────────────────────────────────
mkdir -p "$USER_HOME/.config/kitty" /root/.config/kitty
wget -q https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/kitty/color.ini -O "$USER_HOME/.config/kitty/color.ini"
wget -q https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/kitty/kitty.conf -O "$USER_HOME/.config/kitty/kitty.conf"
wget -q https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/kitty/diff.conf -O "$USER_HOME/.config/kitty/diff.conf"
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin dest="$USER_HOME"
git clone https://github.com/mikesmithgh/kitty-scrollback.nvim "$USER_HOME/kitty.app/kitty-scrollback.nvim" 2>/dev/null || true
cp "$USER_HOME/.config/kitty/"* /root/.config/kitty/

# ── ZOXIDE ───────────────────────────────────────────────────────────────────
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
cp /root/.local/bin/zoxide /usr/bin/zoxide 2>/dev/null || true
chown "$SUDO_USER:$SUDO_USER" /usr/bin/zoxide 2>/dev/null || true

# ── UV TOOLS ────────────────────────────────────────────────────────────────
export PATH="$PATH:/root/.local/bin:$USER_HOME/.local/bin"
uv self update 2>/dev/null || true
uv tool install impacket 2>/dev/null || true
uv tool install "git+https://github.com/Pennyw0rth/NetExec" 2>/dev/null || true
uv tool upgrade --all 2>/dev/null || true

# ── PIPX TOOLS ──────────────────────────────────────────────────────────────
pipx install hyfetch 2>/dev/null || true
pipx install lsassy 2>/dev/null || true
pipx install wappalyzer 2>/dev/null || true
pipx install poetry 2>/dev/null || true
pipx install ntlmrecon 2>/dev/null || true
pipx ensurepath

# ── POETRY + EML-PARSER ─────────────────────────────────────────────────────
pip install eml-parser --break-system-packages 2>/dev/null || true

# ── KERBRUTE ────────────────────────────────────────────────────────────────
git clone https://github.com/attackdebris/kerberos_enum_userlists /usr/share/kerberos_enum_userlists 2>/dev/null || true
rm -f /usr/local/bin/kerbrute
wget -q https://github.com/ropnop/kerbrute/releases/download/v1.0.3/kerbrute_linux_amd64 -O /usr/local/bin/kerbrute
chmod +x /usr/local/bin/kerbrute

# ── PYGPOABUSE ──────────────────────────────────────────────────────────────
git clone https://github.com/Hackndo/pyGPOAbuse.git "$USER_HOME/pyGPOAbuse" 2>/dev/null || true
cd "$USER_HOME/pyGPOAbuse"
python3 -m venv venv && source venv/bin/activate && pip install -r requirements.txt 2>/dev/null || true && deactivate
cd "$USER_HOME"

# ── GUM (Charm RPM repo) ───────────────────────────────────────────────────
cat > /etc/yum.repos.d/charm.repo << 'CHARMEOF'
[charm]
name=Charm
baseurl=https://repo.charm.sh/yum/
enabled=1
gpgcheck=1
gpgkey=https://repo.charm.sh/yum/gpg.key
CHARMEOF
dnf install -y gum

# ── BASH TOOLS ──────────────────────────────────────────────────────────────
mkdir -p "$USER_HOME/dev/bash/"
git clone https://github.com/metal3d/bashsimplecurses "$USER_HOME/dev/bash/bashsimplecurses" 2>/dev/null || true
wget -q https://raw.githubusercontent.com/KermitPurple96/rpcenum/master/rpcenum.sh -O "$USER_HOME/dev/bash/rpcenum"
wget -q https://raw.githubusercontent.com/KermitPurple96/scripts/main/Bash/router -O "$USER_HOME/dev/bash/router"
wget -q https://raw.githubusercontent.com/KermitPurple96/scripts/main/Bash/ww -O "$USER_HOME/dev/bash/ww"
wget -q https://raw.githubusercontent.com/KermitPurple96/scripts/refs/heads/main/Bash/tcpudpScan.sh -O "$USER_HOME/dev/bash/tcpudpscan"
chmod +x "$USER_HOME/dev/bash/"*

# ── WPSCAN ──────────────────────────────────────────────────────────────────
gem install wpscan

# ── GTFO ────────────────────────────────────────────────────────────────────
git clone https://github.com/mzfr/gtfo /usr/bin/gtfo 2>/dev/null || true

# ── DONPAPI ─────────────────────────────────────────────────────────────────
pipx install "git+https://github.com/login-securite/DonPAPI.git" 2>/dev/null || true

# ── MINIKERBEROS ────────────────────────────────────────────────────────────
git clone https://github.com/skelsec/minikerberos.git /tmp/minikerberos 2>/dev/null || true
cd /tmp/minikerberos && pip install . --break-system-packages 2>/dev/null || true
cd "$USER_HOME" && rm -rf /tmp/minikerberos

# ── FZF ─────────────────────────────────────────────────────────────────────
git clone --depth 1 https://github.com/junegunn/fzf.git "$USER_HOME/.fzf" 2>/dev/null || true
"$USER_HOME/.fzf/install" --all --no-bash --no-zsh --no-fish 2>/dev/null || true
cp "$USER_HOME/.fzf/bin/fzf" /usr/local/bin/

# ── PECO ────────────────────────────────────────────────────────────────────
wget -q https://github.com/peco/peco/releases/download/v0.5.11/peco_linux_amd64.tar.gz -O /tmp/peco.tar.gz
cd /tmp && tar xzf peco.tar.gz && cp peco_linux_amd64/peco /usr/local/bin/peco
chmod +x /usr/local/bin/peco && rm -rf /tmp/peco* && cd "$USER_HOME"

# ── POWERSHELL ──────────────────────────────────────────────────────────────
rpm --import https://packages.microsoft.com/keys/microsoft.asc 2>/dev/null || true
cat > /etc/yum.repos.d/microsoft-prod.repo << 'MSEOF'
[packages-microsoft-com-prod]
name=Microsoft Packages for Fedora
baseurl=https://packages.microsoft.com/rhel/9/prod/
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc
MSEOF
dnf install -y powershell 2>/dev/null || echo "WARN: PowerShell install failed — install manually"

# ── RUST ────────────────────────────────────────────────────────────────────
sudo -u "$SUDO_USER" bash -c 'curl --proto "=https" --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y'
sudo -u "$SUDO_USER" bash -c 'source $HOME/.cargo/env && cargo install ntlm-info' 2>/dev/null || true

# ── FISH SHELL CONFIG ───────────────────────────────────────────────────────
mkdir -p "$USER_HOME/.config/fish/functions" /root/.config/fish/functions/
wget -q https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/fish/config.fish -O "$USER_HOME/.config/fish/config.fish"
wget -q https://raw.githubusercontent.com/KermitPurple96/i3-kitty/refs/heads/main/fish/functions/fish_prompt.fish -O "$USER_HOME/.config/fish/functions/fish_prompt.fish"
wget -q https://raw.githubusercontent.com/KermitPurple96/i3-kitty/refs/heads/main/fish/fish_variables -O "$USER_HOME/.config/fish/fish_variables"
chown -R "$SUDO_USER:$SUDO_USER" "$USER_HOME/.config/fish"
chown "$SUDO_USER:$SUDO_USER" /etc/hosts
usermod --shell /usr/bin/fish "$SUDO_USER"
usermod --shell /usr/bin/fish root
ln -sf "$USER_HOME/.config/fish/config.fish" /root/.config/fish/config.fish
ln -sf "$USER_HOME/.config/fish/functions/fish_prompt.fish" /root/.config/fish/functions/fish_prompt.fish
ln -sf "$USER_HOME/.config/fish/fish_variables" /root/.config/fish/fish_variables
wget -q https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/ascii -O "$USER_HOME/ascii"
touch "$USER_HOME"/{shodan_key,CVEmap_key,bloodpass,wpscan_key}

# ── SLIVER C2 ──────────────────────────────────────────────────────────────
curl https://sliver.sh/install | bash 2>/dev/null || true

# ── TMUX ────────────────────────────────────────────────────────────────────
git clone https://github.com/jimeh/tmux-themepack.git "$USER_HOME/.tmux-themepack" 2>/dev/null || true
ln -sf "$USER_HOME/.tmux-themepack" /root/.tmux-themepack
wget -q https://raw.githubusercontent.com/KermitPurple96/i3-kitty/refs/heads/main/tmux.conf -O "$USER_HOME/.tmux.conf"
ln -sf "$USER_HOME/.tmux.conf" /root/.tmux.conf
wget -q https://raw.githubusercontent.com/KermitPurple96/i3-kitty/refs/heads/main/basic.tmuxtheme -O "$USER_HOME/.tmux-themepack/basic.tmuxtheme"

# ── MISC ────────────────────────────────────────────────────────────────────
pip install uploadserver --break-system-packages 2>/dev/null || true

# ── LUA LANGUAGE SERVER ─────────────────────────────────────────────────────
mkdir -p /usr/local/bin/lua-language-server && cd /usr/local/bin/lua-language-server
wget -q https://github.com/LuaLS/lua-language-server/releases/download/3.13.5/lua-language-server-3.13.5-linux-x64.tar.gz
tar -xzf lua-language-server-3.13.5-linux-x64.tar.gz && rm -f lua-language-server-3.13.5-linux-x64.tar.gz
cd "$USER_HOME"

# ── IPV6 TOOLS ──────────────────────────────────────────────────────────────
dnf install -y thc-ipv6 2>/dev/null || {
    git clone https://github.com/vanhauser-thc/thc-ipv6.git /tmp/thc-ipv6
    cd /tmp/thc-ipv6 && make 2>/dev/null || true
    cd "$USER_HOME" && rm -rf /tmp/thc-ipv6
}

# ── i3 WORKSPACE NAMES DAEMON ──────────────────────────────────────────────
pip3 install i3-workspace-names-daemon --break-system-packages 2>/dev/null || true
dnf install -y fontawesome-fonts 2>/dev/null || true

# ── FINAL ───────────────────────────────────────────────────────────────────
chown -R "$SUDO_USER:$SUDO_USER" "$USER_HOME"
rm -f "$USER_HOME"/{lsd,bat,config.sh,Iosevka.zip,readme.md,LICENSE.md}*
rm -f "$USER_HOME"/Roboto*

dnf update -y
updatedb 2>/dev/null || true

echo ""
echo "============================================="
echo " DONE! Reboot recommended: sudo reboot"
echo "============================================="
echo " After reboot:"
echo "   - Select i3 at login screen"
echo "   - Run lxappearance -> select arc-dark"
echo "   - Run: pywal -i ~/.wallpaper/fondo.jpg"
echo "============================================="
