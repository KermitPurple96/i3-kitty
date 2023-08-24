sudo apt-get update && \
sudo apt-get upgrade && \
sudo apt-get -y install kitty keepass2 moreutils xclip ftp exploitdb locate netdiscover feh rdesktop snmp enum4linux dirsearch docker.io scrub jq apache2 ncat ntpdate rlwrap metasploit-framework ipcalc xsltproc swaks flameshot ghex hexedit && \
gem install evil-winrm && \
apt install neo4j bloodhound && \
sudo apt-get install powershell-empire starkiller -y && \
apt install krb5-user

git clone https://github.com/KermitPurple96/kali-clean && \
chmod +x ./kali-clean/install.sh && \
./kali-clean/install.sh && \

wget https://github.com/lsd-rs/lsd/releases/download/0.23.1/lsd-musl_0.23.1_amd64.deb && \
sudo dpkg -i lsd-musl_0.23.1_amd64.deb && \
wget https://github.com/sharkdp/bat/releases/download/v0.23.0/bat_0.23.0_amd64.deb && \
sudo dpkg -i bat_0.23.0_amd64.deb && \

mkdir /home/$SUDO_USER/Descargas/firefox && \
mkdir /home/$SUDO_USER/.zsh && \
git clone https://github.com/zsh-users/zsh-autosuggestions /home/$SUDO_USER/.zsh && \
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /home/$SUDO_USER/.zsh && \
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git /home/$SUDO_USER/.zsh && \

rm /home/$SUDO_USER/.fehbg && 
wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/.fehbg -O /home/$SUDO_USER/.fehbg
mkdir /home/$SUDO_USER/.wallpaper && 
wget https://github.com/KermitPurple96/i3-kitty/blob/main/fondo.jpg -O /home/$SUDO_USER/.wallpaper/fondo.jpg
rm /home/$SUDO_USER/.zshrc && 
wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/.zshrc 
ln -s -f /home/$SUDO_USER/.zshrc /root/.zshrc

mkdir /home/$SUDO_USER/maquinas
mkdir /home/$SUDO_USER/.config/bin
touch /home/$SUDO_USER/.config/bin/{name.txt,target.txt,ttl.txt,target_sys.txt}

wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/usr/share/i3blocks/target_sys.sh -O /usr/share/i3blocks && 
wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/usr/share/i3blocks/target.sh -O /usr/share/i3blocks && 
wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/usr/share/i3blocks/hackthebox_status.sh -O /usr/share/i3blocks &&  
wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/usr/share/i3blocks/ethernet_status.sh -O /usr/share/i3blocks && 
wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/usr/share/i3blocks/access_point.sh -O /usr/share/i3blocks && 
sudo chmod +x /usr/share/i3blocks/*

mkdir /home/$SUDO_USER/.config/kitty && 
wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/kitty/color.ini -O /home/$SUDO_USER/.config/kitty && 
wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/kitty/kitty.conf -O /home/$SUDO_USER/.config/kitty && 

rm -rf /home/$SUDO_USER/.config/i3/* && 
wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/i3/i3blocks.conf -O /home/$SUDO_USER/.config/i3 && 
wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/i3/config && -O /home/$SUDO_USER/.config/i3 && 
wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/i3/clipboard_fix.sh -O /home/$SUDO_USER/.config/i3 && 

chown -R root:root /home/$SUDO_USER/.zsh && 
chown $SUDO_USER:$SUDO_USER /etc/hosts && sudo chmod -R 755 /home/$SUDO_USER/.zsh && 
sudo usermod --shell /usr/bin/zsh $SUDO_USER && sudo usermod --shell /usr/bin/zsh root
cp /home/kermit/.config/kitty/* /root/.config/kitty

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/Hack.zip -O /usr/local/share/fonts/Hack.zip && 
unzip /usr/local/share/fonts/Hack.zip && 
rm /usr/local/share/fonts/Hack.zip

# Red
sudo wget https://github.com/Rvn0xsy/red-tldr/releases/download/v0.4.3/red-tldr_0.4.3_linux_amd64.tar.gz -O /usr/bin
sudo tar -zxvf /usr/bin/red-tldr*.gz && 
/usr/bin/red-tldr update && 
/usr/bin/red-tldr upgrade && 
sudo mv /usr/bin/red-tldr /usr/bin/red && 
sudo rm /usr/bin/red-tldr_0.4.3_linux_amd64.tar.gz

# Arsenal
git clone https://github.com/Orange-Cyberdefense/arsenal.git -O /usr/bin
python3 -m pip install -r /usr/bin/arsenal/requirements.txt && 
mv /usr/bin/arsenal/run /usr/bin/arsenal/ars && 
wget https://github.com/KermitPurple96/i3-kitty/blob/main/my_cheats.md -O /usr/bin/arsenal/my_cheats/my_cheats.md

# Ropper
sudo git clone https://github.com/sashs/ropper.git && sudo pip install capstone && cd ropper && sudo git submodule init && sudo git submodule update

# jump
sudo wget https://github.com/gsamokovarov/jump/releases/download/v0.51.0/jump_linux_amd64_binary -O /usr/bin/jump && 
sudo chmod +x /usr/bin/jump

# locate
cd /usr/bin
sudo apt-get install locate && sudo updatedb

# Dirsearch
cd /usr/bin
sudo apt install dirsearch;

# GTFO
cd /usr/bin
sudo git clone https://github.com/mzfr/gtfo && cd gtfo && sudo chmod +x gtfo

# GO
cd /usr/bin
sudo wget https://go.dev/dl/go1.20.5.linux-amd64.tar.gz && sudo tar -zxvf go1*.gz && sudo go install github.com/OJ/gobuster/v3@latest

# Sublime
cd /usr/bin
sudo wget https://download.sublimetext.com/sublime-text_build-3211_amd64.deb && sudo dpkg -i sublime-text_build-3211_amd64.deb

# fzf
cd /usr/bin
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
sudo mv /home/kermit/.fzf/bin/fzf /usr/local/bin
