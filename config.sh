sudo apt-get update
sudo apt-get upgrade
git clone https://github.com/KermitPurple96/kali-clean && cd kali-clean && chmod +x install.sh && ./install.sh

cd ~

wget https://github.com/lsd-rs/lsd/releases/download/0.23.1/lsd-musl_0.23.1_amd64.deb && sudo dpkg -i lsd-musl_0.23.1_amd64.deb 
wget https://github.com/sharkdp/bat/releases/download/v0.23.0/bat_0.23.0_amd64.deb && sudo dpkg -i bat_0.23.0_amd64.deb

mkdir ~/Descargas/firefox && mkdir ~/.zsh

cd ~/.zsh && git clone https://github.com/zsh-users/zsh-autosuggestions && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git && git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git

cd ~ && rm ~/.fehbg && wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/.fehbg -O ~/fehbg

mkdir ~/.wallpaper && wget https://github.com/KermitPurple96/i3-kitty/blob/main/fondo.jpg -O /home/kermit/.wallpaper/fondo.jpg

rm ~/.zshrc && wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/.zshrc && sudo ln -s -f ~/.zshrc /root/.zshrc

mkdir ~/maquinas

mkdir ~/.config/bin

cd ~/.config/bin && touch {name.txt,target.txt,ttl.txt,target_sys.txt}

cd /usr/share/i3blocks && sudo wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/usr/share/i3blocks/target_sys.sh && sudo wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/usr/share/i3blocks/target.sh && sudo wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/usr/share/i3blocks/hackthebox_status.sh && sudo wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/usr/share/i3blocks/ethernet_status.sh && sudo wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/usr/share/i3blocks/access_point.sh && sudo chmod +x *

mkdir ~/.config/kitty && cd ~/.config/kitty && sudo apt-get -y install kitty && sudo wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/kitty/color.ini && sudo wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/kitty/kitty.conf

cd ~/.config/i3 && sudo rm -rf ~/.config/i3/* && sudo wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/i3/i3blocks.conf && sudo wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/i3/config && sudo wget https://raw.githubusercontent.com/KermitPurple96/i3-kitty/main/i3/clipboard_fix.sh

sudo apt install xclip && sudo chown -R root:root ~/.zsh && sudo chown kermit:kermit /etc/hosts && sudo chmod -R 755 ~/.zsh && sudo usermod --shell /usr/bin/zsh kermit && sudo usermod --shell /usr/bin/zsh root

cd /usr/local/share/fonts && sudo wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/Hack.zip && sudo unzip Hack.zip && sudo rm Hack.zip

cd /usr/bin

# Red
sudo wget https://github.com/Rvn0xsy/red-tldr/releases/download/v0.4.3/red-tldr_0.4.3_linux_amd64.tar.gz && sudo tar -zxvf red-tldr*.gz && ./red-tldr update && ./red-tldr upgrade && sudo mv red-tldr red && sudo rm red-tldr_0.4.3_linux_amd64.tar.gz

# Arsenal
sudo git clone https://github.com/Orange-Cyberdefense/arsenal.git && cd arsenal && sudo python3 -m pip install -r requirements.txt && sudo mv run ars && sudo wget https://github.com/KermitPurple96/i3-kitty/blob/main/my_cheats.md -O /usr/bin/arsenal/my_cheats/my_cheats.md

# Ropper
cd /usr/bin

sudo git clone https://github.com/sashs/ropper.git && sudo pip install capstone && cd ropper && sudo git submodule init && sudo git submodule update

# rlwrap
sudo apt-get install rlwrap;

# jump
cd /usr/bin
sudo wget https://github.com/gsamokovarov/jump/releases/download/v0.51.0/jump_linux_amd64_binary -O jump && sudo chmod +x jump

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
