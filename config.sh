sudo apt-get update
sudo apt-get upgrade
sudo apt-get -y install kitty zsh keepass2 moreutils xclip ftp exploitdb locate netdiscover feh rdesktop snmp enum4linux dirsearch docker.io scrub jq apache2 ncat ntpdate rlwrap metasploit-framework ipcalc xsltproc swaks flameshot ghex hexedit
gem install evil-winrm
apt install neo4j bloodhound
sudo apt-get install powershell-empire starkiller -y

git clone https://github.com/xct/kali-clean
chmod +x /home/$SUDO_USER/kali-clean/install.sh
/home/$SUDO_USER/kali-clean/install.sh -y

wget https://github.com/lsd-rs/lsd/releases/download/0.23.1/lsd-musl_0.23.1_amd64.deb
sudo dpkg -i lsd-musl_0.23.1_amd64.deb
wget https://github.com/sharkdp/bat/releases/download/v0.23.0/bat_0.23.0_amd64.deb
sudo dpkg -i bat_0.23.0_amd64.deb

sudo apt-get install zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mkdir /home/$SUDO_USER/Descargas/firefox
mkdir /home/$SUDO_USER/.zsh
git clone https://github.com/zsh-users/zsh-autosuggestions /home/$SUDO_USER/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /home/$SUDO_USER/.zsh/zsh-syntax-highlighting
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git /home/$SUDO_USER/.zsh/zsh-autocomplete

rm /home/$SUDO_USER/.fehbg
wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/.fehbg -O /home/$SUDO_USER/.fehbg
mkdir /home/$SUDO_USER/.wallpaper
wget https://github.com/KermitPurple96/i3-kitty/blob/main/fondo.jpg -O /home/$SUDO_USER/.wallpaper/fondo.jpg
rm /home/$SUDO_USER/.zshrc
wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/.zshrc
ln -s -f /home/$SUDO_USER/.zshrc /root/.zshrc

mkdir /home/$SUDO_USER/maquinas
mkdir /home/$SUDO_USER/.config/bin
touch /home/$SUDO_USER/.config/bin/{name.txt,target.txt,ttl.txt,target_sys.txt}

wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/usr/share/i3blocks/target_sys.sh -O /usr/share/i3blocks/target_sys.sh
wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/usr/share/i3blocks/target.sh -O /usr/share/i3blocks/target.sh
wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/usr/share/i3blocks/hackthebox_status.sh -O /usr/share/i3blocks/hackthebox_status.sh
wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/usr/share/i3blocks/ethernet_status.sh -O /usr/share/i3blocks/ethernet_status.sh
wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/usr/share/i3blocks/access_point.sh -O /usr/share/i3blocks/access_point.sh
sudo chmod +x /usr/share/i3blocks/*

mkdir /home/$SUDO_USER/.config/kitty
mkdir /root/.config/kitty
wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/kitty/color.ini -O /home/$SUDO_USER/.config/kitty/color.ini
wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/kitty/kitty.conf -O /home/$SUDO_USER/.config/kitty/kitty.conf

rm -rf /home/$SUDO_USER/.config/i3/*
wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/i3/i3blocks.conf -O /home/$SUDO_USER/.config/i3/i3blocks.conf
wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/i3/config -O /home/$SUDO_USER/.config/i3/config
wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/i3/clipboard_fix.sh -O /home/$SUDO_USER/.config/i3/clipboard_fix.sh

chown -R root:root /home/$SUDO_USER/.zsh
chown $SUDO_USER:$SUDO_USER /etc/hosts
sudo chmod -R 755 /home/$SUDO_USER/.zsh
sudo usermod --shell /usr/bin/zsh $SUDO_USER
sudo usermod --shell /usr/bin/zsh root
cp /home/$SUDO_USER/.config/kitty/* /root/.config/kitty/

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/Hack.zip -O /usr/local/share/fonts/Hack.zip
unzip /usr/local/share/fonts/Hack.zip
rm /usr/local/share/fonts/Hack.zip

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
wget https://github.com/KermitPurple96/i3-kitty/blob/main/my_cheats.md -O /usr/bin/arsenal/my_cheats/my_cheats.md

#neovim
wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage -O /usr/bin/nvim
chmod +x /usr/bin/nvim
git clone https://github.com/NvChad/NvChad /home/$SUDO_USER/.config/nvim --depth 1

# jump
sudo wget https://github.com/gsamokovarov/jump/releases/download/v0.51.0/jump_linux_amd64_binary -O /usr/bin/jump
sudo chmod +x /usr/bin/jump

#crackmapexec
python3 -m pip install pipx
pipx ensurepath
pipx install crackmapexec

#kerbrute
pip3 install kerbrute

#wpscan fix
apt remove wpscan -y
apt-get autoremove -y
apt-get autoclean
hash -r
apt install ruby-dev -y
gem install wpscan

# GTFO
sudo git clone https://github.com/mzfr/gtfo /usr/bin/gtfo
chmod +x /usr/bin/gtfo

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git /home/$SUDO_USER/.fzf
/home/$SUDO_USER/.fzf/install -y
sudo mv /home/$SUDO_USER/.fzf/bin/fzf /usr/local/bin
