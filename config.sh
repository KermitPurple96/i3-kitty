sudo apt-get update
sudo apt-get upgrade

# INSTALL XCT ENVIRONMENT
# https://github.com/xct/kali-clean
git clone https://github.com/xct/kali-clean
cd kali-clean
./install.sh

#packages
sudo apt install curl dnsrecon enum4linux feroxbuster impacket-scripts nbtscan nikto nmap onesixtyone oscanner redis-tools smbclient smbmap snmp sslscan sipvicious tnscmd10g whatweb wkhtmltopdf
sudo apt install autorecon
sudo apt-get -y install seclists putty-tools powercat lolcat neofetch build-essential gcc feroxbuster pipx zsh keepass2 moreutils xclip ftp exploitdb locate netdiscover feh rdesktop snmp enum4linux dirsearch docker.io scrub jq apache2 ncat ntpdate rlwrap metasploit-framework ipcalc xsltproc swaks flameshot ghex hexedit
sudo apt-get update && sudo apt-get -y install golang-go 
python3 -m pip install --user pwntools

go install github.com/ffuf/ffuf/v2@latest
go install github.com/OJ/gobuster/v3@latest

mkdir /home/$SUDO_USER/tools
wget https://raw.githubusercontent.com/KermitPurple96/scripts/main/Bash/tools.sh -O /home/$SUDO_USER/tools/tools.sh

mkdir /home/$SUDO_USER/dev
mkdir /home/$SUDO_USER/dev/python
wget https://raw.githubusercontent.com/KermitPurple96/scripts/main/Python/shell.py -O /home/$SUDO_USER/dev/python/shell

mkdir /home/$SUDO_USER/Descargas/firefox
mkdir /home/$SUDO_USER/maquinas
mkdir /home/$SUDO_USER/.config/bin
touch /home/$SUDO_USER/.config/bin/{name.txt,target.txt,ttl.txt,target_sys.txt}

#lsd
wget https://github.com/lsd-rs/lsd/releases/download/0.23.1/lsd-musl_0.23.1_amd64.deb
sudo dpkg -i lsd-musl_0.23.1_amd64.deb

#bat
wget https://github.com/sharkdp/bat/releases/download/v0.23.0/bat_0.23.0_amd64.deb
sudo dpkg -i bat_0.23.0_amd64.deb

# wallpaper
rm /home/$SUDO_USER/.fehbg
wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/.fehbg -O /home/$SUDO_USER/.fehbg
mkdir /home/$SUDO_USER/.wallpaper
wget https://github.com/KermitPurple96/i3-kitty/blob/main/fondo.jpg\?raw=true -O /home/$SUDO_USER/.wallpaper/fondo.jpg

# i3
wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/usr/share/i3blocks/target_sys.sh -O /usr/share/i3blocks/target_sys.sh
wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/usr/share/i3blocks/target.sh -O /usr/share/i3blocks/target.sh
wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/usr/share/i3blocks/hackthebox_status.sh -O /usr/share/i3blocks/hackthebox_status.sh
wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/usr/share/i3blocks/ethernet_status.sh -O /usr/share/i3blocks/ethernet_status.sh
wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/usr/share/i3blocks/access_point.sh -O /usr/share/i3blocks/access_point.sh
wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/usr/share/i3blocks/session.sh -O /usr/share/i3blocks/session.sh
sudo chmod +x /usr/share/i3blocks/*

rm -rf /home/$SUDO_USER/.config/i3/*
wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/i3/i3blocks.conf -O /home/$SUDO_USER/.config/i3/i3blocks.conf
wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/i3/config -O /home/$SUDO_USER/.config/i3/config
wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/i3/clipboard_fix.sh -O /home/$SUDO_USER/.config/i3/clipboard_fix.sh

#zsh
####Done in xct environment####
sudo apt-get install zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
###############################

#zsh pluggins
mkdir /home/$SUDO_USER/.zsh
git clone https://github.com/zsh-users/zsh-autosuggestions /home/$SUDO_USER/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /home/$SUDO_USER/.zsh/zsh-syntax-highlighting
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git /home/$SUDO_USER/.zsh/zsh-autocomplete

rm /home/$SUDO_USER/.zshrc
wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/zshrc
mv /home/$SUDO_USER/zshrc /home/$SUDO_USER/.zshrc
ln -s -f /home/$SUDO_USER/.zshrc /root/.zshrc

chown -R root:root /home/$SUDO_USER/.zsh
chown $SUDO_USER:$SUDO_USER /etc/hosts
sudo chmod -R 755 /home/$SUDO_USER/.zsh
sudo usermod --shell /usr/bin/zsh $SUDO_USER
sudo usermod --shell /usr/bin/zsh root

# fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/Hack.zip -O /usr/local/share/fonts/Hack.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/Hack.zip -O /home/$SUDO_USER/.local/share/fonts/Hack.zip

cd /usr/local/share/fonts
unzip /usr/local/share/fonts/Hack.zip
cd /home/$SUDO_USER/.local/share/fonts/
unzip /home/$SUDO_USER/.local/share/fonts/Hack.zip
cd /home/$SUDO_USER
rm /usr/local/share/fonts/Hack.zip
rm /home/$SUDO_USER/.local/share/fonts/Hack.zip

fc-cache -fv

#make sure these files are the same in /home/$SUDO_USER and /root
# ~/.config/i3/config
# ~/.config/alacritty/alacritty.yml
# ~/.config/i3/i3blocks.conf
# ~/.config/compton/compton.conf
# ~/.config/rofi/config

#rustscan
wget wget https://github.com/RustScan/RustScan/archive/refs/tags/2.1.1.zip
unzip /home/$SUDO_USER/2.1.1.zip
cd /home/$SUDO_USER/RustScan-2.1.1
cargo build --release
rm /home/$SUDO_USER/2.1.1.zip
mv /home/$SUDO_USER/RustScan-2.1.1/target/release/rustscan /usr/bin/rustscan
cd /home/$SUDO_USER

#evil-winrm
gem install evil-winrm

#neo4j bloodhound
apt install neo4j bloodhound

#empire
sudo apt-get install powershell-empire starkiller -y

# Red
sudo wget https://github.com/Rvn0xsy/red-tldr/releases/download/v0.4.3/red-tldr_0.4.3_linux_amd64.tar.gz -O /usr/bin/red-tldr_0.4.3_linux_amd64.tar.gz
sudo tar -zxvf /usr/bin/red-tldr*.gz -C /usr/bin/
/usr/bin/red-tldr update
/usr/bin/red-tldr upgrade
sudo mv /usr/bin/red-tldr /usr/bin/red
sudo rm /usr/bin/red-tldr_0.4.3_linux_amd64.tar.gz

# Arsenal
git clone https://github.com/Orange-Cyberdefense/arsenal.git /usr/bin/arsenal
python3 -m pip install -r /usr/bin/arsenal/requirements.txt
mv /usr/bin/arsenal/run /usr/bin/arsenal/ars
wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/arsenal/mycheats.md -O /usr/bin/arsenal/my_cheats/my_cheats.md

#neovim
wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage -O /usr/bin/nvim
chmod +x /usr/bin/nvim
#nvchad
git clone https://github.com/NvChad/NvChad /home/$SUDO_USER/.config/nvim --depth 1 && nvim
sudo chown $SUDO_USER:$SUDO_USER -R /home/$SUDO_USER/.config/nvim

#subl
wget https://download.sublimetext.com/sublime-text_build-3211_amd64.deb
dpkg -i sublime-text_build-3211_amd64.deb
rm sublime-text_build-3211_amd64.deb

#kitty
mkdir /home/$SUDO_USER/.config/kitty
mkdir /root/.config/kitty
wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/kitty/color.ini -O /home/$SUDO_USER/.config/kitty/color.ini
wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/kitty/kitty.conf -O /home/$SUDO_USER/.config/kitty/kitty.conf

curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin \
    dest=/home/$SUDO_USER
    
#kitty scrollback
git clone https://github.com/mikesmithgh/kitty-scrollback.nvim /home/$SUDO_USER/kitty.app/kitty-scrollback.nvim
cp /home/$SUDO_USER/.config/kitty/* /root/.config/kitty/

# jump
# sudo wget https://github.com/gsamokovarov/jump/releases/download/v0.51.0/jump_linux_amd64_binary -O /usr/bin/jump
# sudo chmod +x /usr/bin/jump

# zoxide
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

#crackmapexec
python3 -m pip install pipx
pipx ensurepath
pipx install crackmapexec

#impacket & cme
python3 -m pip install --user pipx 
python3 -m pipx ensurepath
python3 -m pipx install impacket
python3 -m pipx install cme

#nxc
sudo apt install pipx git
pipx ensurepath
pipx install git+https://github.com/Pennyw0rth/NetExec

#kerbrute
pip3 install kerbrute
git clone https://github.com/attackdebris/kerberos_enum_userlists /usr/share/kerberos_enum_userlists
# kerbrute
wget https://github.com/ropnop/kerbrute/releases/download/v1.0.3/kerbrute_linux_amd64 -O /usr/bin/kerbrute
chmod +x /usr/bin/kerbrute

#gum
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list
sudo apt update && sudo apt install gum

#bashsimplecurses
mkdir -p scripts/{bash,python}
git clone https://github.com/metal3d/bashsimplecurses /home/kermit/scripts/bash/bashsimplecurses

#wpscan fix
apt remove wpscan -y
apt-get autoremove -y
apt-get autoclean
hash -r
apt install ruby-dev -y
gem install wpscan

#wfuzz fix
apt --purge remove python3-pycurl && apt install libcurl4-openssl-dev libssl-dev && pip3 install pycurl wfuzz

# GTFO
sudo git clone https://github.com/mzfr/gtfo /usr/bin/gtfo
chmod +x /usr/bin/gtfo

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git /home/$SUDO_USER/.fzf
/home/$SUDO_USER/.fzf/install
sudo mv /home/$SUDO_USER/.fzf/bin/fzf /usr/local/bin

#powershell
wget https://github.com/PowerShell/PowerShell/releases/download/v7.4.1/powershell_7.4.1-1.deb_amd64.deb
dpkg -i powershell_7.4.1-1.deb_amd64.deb

rm /home/$SUDO_USER/alacritty*
rm /home/$SUDO_USER/lsd*
rm /home/$SUDO_USER/bat*
rm /home/$SUDO_USER/config.sh
rm /home/$SUDO_USER/Iosevka.zip
rm /home/$SUDO_USER/Roboto*
rm /home/$SUDO_USER/readme.md
rm /home/$SUDO_USER/LICENSE.md

wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/ascii -O /home/$SUDO_USER/ascii
