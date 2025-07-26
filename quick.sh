sudo apt-get update
sudo apt-get upgrade

sudo apt install -y libsasl2-dev python-dev-is-python3 libldap2-dev libssl-dev neovim snmp-mibs-downloader thc-ipv6 ipv6toolkit golang-go proxychains neo4j bloodhound dnsmasq smtp-user-enum dnscat2 curl ncat dnsrecon enum4linux feroxbuster impacket-scripts nbtscan nmap onesixtyone smbclient smbmap snmp sslscan whatweb pipx wfuzz gh kitty villain seclists powercat certipy-ad bloodyad coreutils traceroute feroxbuster hping3 zsh remmina keepass2 coreutils moreutils xclip ftp exploitdb locate netdiscover rdesktop snmp dirsearch docker-compose docker.io jq rlwrap metasploit-framework ipcalc xsltproc swaks flameshot ghex hexedit

sudo gem install evil-winrm
sudo gem install wpscan

curl -L https://ghst.ly/getbhce > docker-compose.yml

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

# uv
curl -LsSf https://astral.sh/uv/install.sh | sh
uv self update
uv tool install impacket
uv tool install git+https://github.com/Pennyw0rth/NetExec
uv tool upgrade --all

#nxc
pipx install hyfetch lsassy wappalyzer poetry ntlmrecon
pipx ensurepath

#pipx install git+https://github.com/Pennyw0rth/NetExec

#poetry netexec
poetry self add "poetry-dynamic-versioning[plugin]"
poetry init
poetry dynamic-versioning enable
git clone https://github.com/Pennyw0rth/NetExec
cd NetExec
poetry install
poetry run NetExec
poetry update impacket

#kerbrute
git clone https://github.com/attackdebris/kerberos_enum_userlists /usr/share/kerberos_enum_userlists
# kerbrute
rm /usr/local/bin/kerbrute
wget https://github.com/ropnop/kerbrute/releases/download/v1.0.3/kerbrute_linux_amd64 -O /usr/local/bin/kerbrute
chmod +x /usr/local/bin/kerbrute

git clone https://github.com/Hackndo/pyGPOAbuse.git
cd pyGPOAbuse
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
exit

# GTFO
sudo git clone https://github.com/mzfr/gtfo /usr/bin/gtfo
chmod +x /usr/bin/gtfo

# donpapi
pipx install git+https://github.com/login-securite/DonPAPI.git

#minikerberos
git clone https://github.com/skelsec/minikerberos.git
cd minikerberos
python3 setup.py install

#rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install ntlm-info
