sudo apt-get update
sudo apt-get upgrade

# INSTALL XCT ENVIRONMENT
# https://github.com/xct/kali-clean
sudo apt install libstartup-notification0-dev libxcb-xkb-dev libxcb-xinerama0-dev libxcb-randr0-dev libxcb-cursor-dev libxcb-keysyms1-dev libxcb-icccm4-dev libxkbcommon-dev libxkbcommon-x11-dev libyajl-dev libpcre2-dev libcairo2-dev libpango1.0-dev libev-dev

git clone https://github.com/xct/kali-clean
cd kali-clean
./install.sh
apt update
apt upgrade

cd ..
rm -rf kali-clean

#packages
sudo apt install libsasl2-dev python-dev-is-python3 libldap2-dev libssl-dev snmp-mibs-downloader meson proxychains dnsmasq ripgrep smtp-user-enum dnscat2 curl ncat dnsrecon enum4linux feroxbuster impacket-scripts nbtscan nmap onesixtyone oscanner redis-tools smbclient smbmap snmp sslscan sipvicious tnscmd10g whatweb wkhtmltopdf autorecon
sudo apt-get -y install kitty seclists putty-tools powercat lolcat neofetch build-essential gcc feroxbuster hping3 pipx zsh remmina keepass2 moreutils xclip ftp exploitdb locate netdiscover feh rdesktop snmp enum4linux dirsearch docker-compose docker.io scrub jq apache2 ncat ntpdate rlwrap metasploit-framework ipcalc xsltproc swaks flameshot ghex hexedit
sudo apt-get update && sudo apt-get -y install golang-go 

apt update
apt upgrade
python3 -m pip install --user pwntools

git clone https://github.com/wirzka/incursore.git
sudo ln -s $(pwd)/incursore/incursore.sh /usr/local/bin/

# run as user and root
#zsh
# bash <(curl https://raw.githubusercontent.com/atuinsh/atuin/main/install.sh)
# fish
bash (curl --proto '=https' --tlsv1.2 -sSf https://setup.atuin.sh | psub)

go install github.com/ffuf/ffuf/v2@latest
go install github.com/OJ/gobuster/v3@latest

mkdir /home/$SUDO_USER/tools
wget https://raw.githubusercontent.com/KermitPurple96/scripts/main/Bash/tools.sh -O /home/$SUDO_USER/tools/tools.sh

mkdir /home/$SUDO_USER/dev
mkdir /home/$SUDO_USER/dev/python
git clone https://github.com/KermitPurple96/Shellpy /home/$SUDO_USER/dev/python/shellpy
git clone https://github.com/KermitPurple96/OSCP-PythonSupportTools /home/$SUDO_USER/dev/python/support
wget https://raw.githubusercontent.com/KermitPurple96/scripts/main/Python/md4.py -O /home/$SUDO_USER/dev/python/md4
wget https://raw.githubusercontent.com/mubix/IOXIDResolver/main/IOXIDResolver.py -O /home/$SUDO_USER/dev/python/IOXIDResolver
wget https://raw.githubusercontent.com/KermitPurple96/scripts/refs/heads/main/Python/look.py -O /home/$SUDO_USER/dev/python/lookpy
wget https://raw.githubusercontent.com/KermitPurple96/scripts/refs/heads/main/Python/ridbrute -O /home/$SUDO_USER/dev/python/ridbrute
wget https://raw.githubusercontent.com/KermitPurple96/scripts/refs/heads/main/Python/hex2sid -O /home/$SUDO_USER/dev/python/hex2sid
chmod -R +x /home/$SUDO_USER/dev/python/*

mkdir /home/$SUDO_USER/dev/go
wget https://raw.githubusercontent.com/KermitPurple96/fastTCPscan/main/fastTCPscan.go -O /home/$SUDO_USER/dev/go/fastTCPScan.go 
go build -ldflags "-s -w" /home/$SUDO_USER/dev/go/fastTCPScan.go
upx brute /home/$SUDO_USER/dev/go/fastTCPScan.go
chmod +x /home/$SUDO_USER/dev/go/fastTCPScan

mkdir /home/$SUDO_USER/Descargas/firefox
mkdir /home/$SUDO_USER/maquinas
mkdir /home/$SUDO_USER/.config/bin
touch /home/$SUDO_USER/.config/bin/{name.txt,target.txt,ttl.txt,target_sys.txt}
sudo chown kermit:kermit -R /home/$SUDO_USER/.config/bin

#lsd
wget https://github.com/lsd-rs/lsd/releases/download/0.23.1/lsd-musl_0.23.1_amd64.deb
sudo dpkg -i lsd-musl_0.23.1_amd64.deb

#bat
wget https://github.com/sharkdp/bat/releases/download/v0.24.0/bat_0.24.0_amd64.deb
apt install ./bat_*

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
echo '' > /usr/share/i3blocks/iface
sudo chmod +x /usr/share/i3blocks/*
sudo chown $SUDO_USER:$SUDO_USER /usr/share/i3blocks/*

rm -rf /home/$SUDO_USER/.config/i3/*
wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/i3/i3blocks.conf -O /home/$SUDO_USER/.config/i3/i3blocks.conf
wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/i3/config -O /home/$SUDO_USER/.config/i3/config
wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/i3/clipboard_fix.sh -O /home/$SUDO_USER/.config/i3/clipboard_fix.sh

#compton
mkdir /home/$SUDO_USER/.config/compton
wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/compton/compton.conf -O /home/$SUDO_USER/.config/compton/compton.conf

# rofi
mkdir /home/$SUDO_USER/.config/rofi
wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/rofi/config.rasi -O /home/$SUDO_USER/.config/rofi/config.rasi

#zsh
####Done in xct environment####
#sudo apt-get install zsh
#sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
###############################

#zsh pluggins
#mkdir /home/$SUDO_USER/.zsh
#git clone https://github.com/zsh-users/zsh-autosuggestions /home/$SUDO_USER/.zsh/zsh-autosuggestions
#git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /home/$SUDO_USER/.zsh/zsh-syntax-highlighting
#git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git /home/$SUDO_USER/.zsh/zsh-autocomplete

#rm /home/$SUDO_USER/.zshrc
#wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/zshrc
#mv /home/$SUDO_USER/zshrc /home/$SUDO_USER/.zshrc
#ln -s -f /home/$SUDO_USER/.zshrc /root/.zshrc

#chown -R root:root /home/$SUDO_USER/.zsh
#chown $SUDO_USER:$SUDO_USER /etc/hosts
#sudo chmod -R 755 /home/$SUDO_USER/.zsh
#sudo usermod --shell /usr/bin/zsh $SUDO_USER
#sudo usermod --shell /usr/bin/zsh root

# fonts
mkdir /home/$SUDO_USER/.local/share/fonts/
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
wget https://github.com/RustScan/RustScan/releases/download/2.3.0/rustscan-2.3.0-x86_64-linux.zip
unzip /home/$SUDO_USER/rustscan-2.3.0-x86_64-linux.zip
mv /home/$SUDO_USER/tmp/rustscan-2.3.0-x86_64-linux/rustscan /usr/bin/

#evil-winrm
gem install evil-winrm

#neo4j bloodhound
apt install neo4j bloodhound

# bloodhound docker
curl -L https://ghst.ly/getbhce > docker-compose.yml
docker-compose up
# take the random password from the output
# go to localhost:8080/ui/login
# login as admin/<random password>
# reset password

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
cd /usr/bin/arsenal
python3 -m venv ars
pip install -r requirements.txt
wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/arsenal/mycheats.md -O /usr/bin/arsenal/my_cheats/my_cheats.md
rm /usr/bin/arsenal/ars/bin/activate.fish
wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/refs/heads/main/arsenal/activate.fish -O /usr/bin/arsenal/ars/bin/activate.fish
cd /home/$SUDO_USER


#neovim
wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage -O /usr/bin/nvim
chmod +x /usr/bin/nvim

#lazy vim as ROOT and $SUDO_USER
#mv ~/.config/nvim{,.bak}
#mv ~/.local/share/nvim{,.bak}
#mv ~/.local/state/nvim{,.bak}
#mv ~/.cache/nvim{,.bak}
#git clone https://github.com/LazyVim/starter ~/.config/nvim
#rm -rf ~/.config/nvim/.git
#nvim

#nvchad
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
sudo chown $SUDO_USER:$SUDO_USER -R /home/$SUDO_USER/.config/
sudo cp -r /home/$SUDO_USER/.config/nvim /root/.config/nvim
nvim

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

#nxc
sudo apt install pipx git
pipx ensurepath
pipx install git+https://github.com/Pennyw0rth/NetExec

#poetry netexec
pipx install poetry
poetry self add "poetry-dynamic-versioning[plugin]"
poetry init
poetry dynamic-versioning enable
git clone https://github.com/Pennyw0rth/NetExec
cd NetExec
poetry install
poetry run NetExec
poetry update impacket


#impacket pipx
#python3 -m pip install pipx
#python3 -m pip install --user pipx 
#python3 -m pipx ensurepath
python3 -m pipx install impacket

#ftp
pip install pyftpdlib

#kerbrute
git clone https://github.com/attackdebris/kerberos_enum_userlists /usr/share/kerberos_enum_userlists
# kerbrute
rm /usr/local/bin/kerbrute
wget https://github.com/ropnop/kerbrute/releases/download/v1.0.3/kerbrute_linux_amd64 -O /usr/local/bin/kerbrute
chmod +x /usr/local/bin/kerbrute

#gum
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list
sudo apt update && sudo apt install gum

#bashsimplecurses
mkdir -p /home/$SUDO_USER/dev/bash/
git clone https://github.com/metal3d/bashsimplecurses /home/$SUDO_USER/dev/bash/bashsimplecurses
wget https://raw.githubusercontent.com/KermitPurple96/rpcenum/master/rpcenum.sh -O /home/$SUDO_USER/dev/bash/rpcenum
wget https://raw.githubusercontent.com/KermitPurple96/scripts/main/Bash/router -O /home/$SUDO_USER/dev/bash/router
wget https://raw.githubusercontent.com/KermitPurple96/scripts/refs/heads/main/Bash/tcpudpScan.sh -O /home/$SUDO_USER/dev/bash/tcpudpscan
chmod +x /home/$SUDO_USER/dev/bash/*

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

# donpapi
pipx install donpapi

#minikerberos
git clone https://github.com/skelsec/minikerberos.git
cd minikerberos
python3 setup.py install

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git /home/$SUDO_USER/.fzf
/home/$SUDO_USER/.fzf/install
sudo mv /home/$SUDO_USER/.fzf/bin/fzf /usr/local/bin

# peco
wget https://github.com/peco/peco/releases/download/v0.5.11/peco_linux_amd64.tar.gz
gunzip peco_linux_amd64.tar.gz
tar xfv peco_linux_amd64.tar
chmod +x peco_linux_amd64/peco
cp peco /bin/peco

#powershell
wget https://github.com/PowerShell/PowerShell/releases/download/v7.4.3/powershell-lts_7.4.3-1.deb_amd64.deb
dpkg -i powershell-lts_7.4.3-1.deb_amd64.deb
rm /home/$SUDO_USER/powershell*

rm /home/$SUDO_USER/alacritty*
rm /home/$SUDO_USER/lsd*
rm /home/$SUDO_USER/bat*
rm /home/$SUDO_USER/config.sh
rm /home/$SUDO_USER/Iosevka.zip
rm /home/$SUDO_USER/Roboto*
rm /home/$SUDO_USER/readme.md
rm /home/$SUDO_USER/LICENSE.md

#rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

cargo install ntlm-info

# Fish shell
apt install fish
chsh -s /usr/bin/fish
mkdir /home/$SUDO_USER/.config/fish/
mkdir /home/$SUDO_USER/.config/fish/functions
mkdir /root/.config/fish/functions/
# remember edit last line of /home/$SUDO_USER/.config/kitty/kitty.conf 

wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/fish/config.fish -O /home/$SUDO_USER/.config/fish/config.fish
wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/refs/heads/main/fish/functions/fish_prompt.fish -O /home/$SUDO_USER/.config/fish/functions/fish_prompt.fish

chown -R $SUDO_USER:$SUDO_USER /home/$SUDO_USER/.config/fish
chown $SUDO_USER:$SUDO_USER /etc/hosts

sudo usermod --shell /usr/bin/fish $SUDO_USER
sudo usermod --shell /usr/bin/fish root

sudo ln -s -f /home/$SUDO_USER/.config/fish/config.fish /root/.config/fish/config.fish
sudo ln -s -f /home/$SUDO_USER/.config/fish/functions/fish_prompt.fish /root/.config/fish/functions/fish_prompt.fish

wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/ascii -O /home/$SUDO_USER/ascii

touch /home/$SUDO_USER/shodan_key
touch /home/$SUDO_USER/CVEmap_key
touch /home/$SUDO_USER/bloodpass
touch /home/$SUDO_USER/wpscan_key


apt install docker.io docker-compose
mkdir -p /opt/bloodhound
cd /opt/bloodhound
curl -L https://ghst.ly/getbhce -o docker-compose.yml
docker-compose up -d
docker-compose logs bloodhound | grep 'Password'
# -> 127.0.0.1:8080/ui/login admin/password

pip install uploadserver --break-system-packages


updatedb





