# ~/.zshrc
# Prompt
#Colors
 
endcolor="\033[0m\e[0m" 
green="\e[0;32m\033[1m"
red="\e[0;31m\033[1m"
blue="\e[0;34m\033[1m"
yellow="\e[0;33m\033[1m"
purple="\e[0;35m\033[1m"
turquoise="\e[0;36m\033[1m"
gray="\e[0;37m\033[1m"
negro="\e[0;30m\033[1m"
fondonegro="\e[0;40m\033[1m"
fondoverde="\e[0;42m\033[1m"
fondoamarillo="\e[0;43m\033[1m"
fondoazul="\e[0;44m\033[1m"
fondopurple="\e[0;46m\033[1m"
fondogris="\e[0;47m\033[1m"

 
if [[ $EUID -ne 0 ]]; then    
    PROMPT="%F{#00FFFF}$USER%f%F{#FBFF00}@%f%F{red}parrot [%f%F{#00FF00}%d%f%F{red}]%(?..[%?])%f%F{#FFFF00}$ %f"
else
   PROMPT="%F{#0070FF}$USER%f%F{#FBFF00}@%f%F{red}parrot [%f%F{#00FF00}%d%f%F{red}]%(?..[%?])%f%F{#FFFF00}# %f"
fi
 
 
# Export PATH$
export PATH=./:/home/kermit/.local/bin:/usr/bin/:/usr/share/responder:/usr/share/ghidra:/usr/share/hydra:/usr/share/libreoffice:/snap/bin:/usr/sandbox:/usr/local/bin:/usr/local/go/bin:/bin:/usr/local/games:/usr/games:/usr/share/games:/usr/local/sbin:/usr/sbin:/sbin:/usr/local/bin:/bin:/usr/local/games:/usr/games:/home/kermit/.fzf/bin:/opt/exploitdb:/root/.local/bin:/home/kermit/scripts/bash:/home/kermit/scripts/python:/usr/share/metasploit-framework/tools/exploit:/usr/bin/arsenal:/usr/bin/gtfo/:/home/kermit/.fzf/bin/:/usr/share/Wordpresscan/:/root/.local/pipx/shared/bin:/root/go/bin/:/home/kermit/go/bin:/usr/bin/pwsh/:PATH
 
# Add as ~/.zshrc
export ip=$(/usr/bin/cat /home/kermit/.config/bin/target.txt)
export name=$(/usr/bin/cat /home/kermit/.config/bin/target_sys.txt)
export _JAVA_AWT_WM_NONREPARENTING=1
export wpscan=$(cat /home/kermit/wpscan_key)
export wpscan=$(cat /home/kermit/shodan_key)
#export http_proxy=127.0.0.1:8080
#export https_proxy=127.0.0.1:8080
source /home/kermit/scripts/bash/bashsimplecurses/simple_curses.sh


function kroot()
{
  /usr/bin/kitty &> /dev/null & disown
}
function getusers()
{
# Lee la primera línea del archivo y extrae la cadena antes del primer ":"
users=$(cat $1 | cut -d ':' -f 1 | sort -u | uniq)
echo $users
}

function gethashes()
{
# Lee la primera línea del archivo y extrae la cadena antes del primer ":"
hashes=$(cat $1 | awk -F ':' '{print $NF}' | sort -u | uniq)
echo $hashes
}
function ipt()
{
  echo $ip
}
function ipn()
{
  echo $name
}
function xp()
{
  xclip -sel clip
}
function hexen()
{
  echo "$@" | xxd -p
}
function hexde()
{
  echo "$@" | xxd -p -r
}
function rot13()
{
  echo "$@" | tr 'A-Za-z' 'N-ZA-Mn-za-m'
}
function pin()
{
  jump pin $1
}
function unpin()
{
  jump unpin $1
}
function procnet()
{
  echo; for port in $(cat $1 | awk '{print $2}' | grep -v "local" | awk '{print $2}' FS=":" | sort -u); do echo -ne "\t${yellow}[+]${endcolor} Port $port -> ${red} $((0x$port))\n" ${endcolor}; done | sort -n; echo
}
function fibtrie(){
  cat $1 | grep "LOCAL" -B 1 | grep -oP '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' | sort -u
}

alias neofetch='neofetch --source /home/kermit/ascii'
alias urlencode='python3 -c "import sys, urllib.parse as ul; print (ul.quote_plus(sys.argv[1]))"'
alias urldecode='python3 -c "import sys, urllib.parse as ul; print(ul.unquote_plus(sys.argv[1]))"'
# alias
alias burpro="java --illegal-access=permit -Dfile.encoding=utf-8 -javaagent:/home/kermit/Desktop/Burp-Suite/loader.jar -noverify -jar /home/kermit/Desktop/Burp-Suite/Burp_Suite_Pro.jar &"
alias kitten="kitty +kitten icat"
alias pins='jump pins'
alias js='js-beautify'

eval "$(zoxide init zsh)"
alias x='zoxide'


# Alias's for multiple directory listing commands
alias la='lsd -Aalh' # show hidden files
alias ls='lsd -aFh --color=always' # add colors and file type extensions
alias ls='lsd'
alias lx='lsd -lXBh' # sort by extension
alias lk='lsd -lSrh' # sort by size
alias lc='lsd -lcrh' # sort by change time
alias lu='lsd -lurh' # sort by access time
alias lr='lsd -lRh' # recursive ls
alias lt='lsd -ltrh' # sort by date
alias lm='lsd -alh |more' # pipe through 'more'
alias lw='lsd -xAh' # wide listing format
alias ll='lsd -Fls' # long listing format
alias labc='lsd -lap' #alphabetical sort
alias lf="lsd -l | egrep -v '^d'" # files only
alias ldir="lsd -l | egrep '^d'" # directories only
 
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
 
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
 
# Search command line history
alias h="history | grep "
 
# Search running processes
alias p="ps aux | grep "
alias topcpu="/bin/ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10"
 
# Search files in the current folder
alias f="find . | grep "
 
# Count all files (recursively) in the current folder
alias countfiles="for t in files links directories; do echo \`find . -type \${t:0:1} | wc -l\` \$t; done 2> /dev/null"
 
# To see if a command is aliased, a file, or a built-in command
alias checkcommand="type -t"
 
# Show current network connections to the server
alias ipview="netstat -anpl | grep :80 | awk {'print \$5'} | cut -d\":\" -f1 | sort | uniq -c | sort -n | sed -e 's/^ *//' -e 's/ *\$//'"
 
# Show open ports
alias openports='netstat -nape --inet'
 
# Alias's for safe and forced reboots
alias rebootsafe='sudo shutdown -r now'
alias rebootforce='sudo shutdown -r -n now'
 
# Alias's to show disk space and space used in a folder
alias diskspace="du -S | sort -n -r |more"
alias folders='du -h --max-depth=1'
alias folderssort='find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn'
alias tree='tree -CAhF --dirsfirst'
alias treed='tree -CAFd'
alias mountedinfo='df -hT'
 
# Show all logs in /var/log
alias logs="sudo find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f"
 
 
# Extracts any archive(s) (if unp isn't installed)
extract () {
	for archive in $*; do
		if [ -f $archive ] ; then
			case $archive in
				*.tar.bz2)   tar xvjf $archive    ;;
				*.tar.gz)    tar xvzf $archive    ;;
				*.bz2)       bunzip2 $archive     ;;
				*.rar)       rar x $archive       ;;
				*.gz)        gunzip $archive      ;;
				*.tar)       tar xvf $archive     ;;
				*.tbz2)      tar xvjf $archive    ;;
				*.tgz)       tar xvzf $archive    ;;
				*.zip)       unzip $archive       ;;
				*.Z)         uncompress $archive  ;;
				*.7z)        7z x $archive        ;;
				*)           echo "don't know how to extract '$archive'..." ;;
			esac
		else
			echo "'$archive' is not a valid file!"
		fi
	done
}
 
 
 
# Searches for text in all files in the current folder
ftext ()
{
	# -i case-insensitive
	# -I ignore binary files
	# -H causes filename to be printed
	# -r recursive search
	# -n causes line number to be printed
	# optional: -F treat search term as a literal, not a regular expression
	optional: -l only print filenames and not the matching lines ex. grep -irl "$1" *
	grep -iIHrn --color=always "$1" . | less -r
}
 
# Copy file with a progress bar
cpp()
{
	set -e
	strace -q -ewrite cp -- "${1}" "${2}" 2>&1 \
	| awk '{
	count += $NF
	if (count % 10 == 0) {
		percent = count / total_size * 100
		printf "%3d%% [", percent
		for (i=0;i<=percent;i++)
			printf "="
			printf ">"
			for (i=percent;i<100;i++)
				printf " "
				printf "]\r"
			}
		}
	END { print "" }' total_size=$(stat -c '%s' "${1}") count=0
}
 
#Automatically do an ls after each cd
cd ()
{
  if [ -n "$1" ]; then
  	builtin cd "$@" && lsd -lah
 	else
 		builtin cd ~ && ls
 	fi
}
 
# IP address lookup
alias whatismyip="whatsmyip"
function whatsmyip ()
{
	# Dumps a list of all IP addresses for every device
	# /sbin/ifconfig |grep -B1 "inet addr" |awk '{ if ( $1 == "inet" ) { print $2 } else if ( $2 == "Link" ) { printf "%s:" ,$1 } }' |awk -F: '{ print $1 ": " $3 }';
 
  echo -ne "\n\t${blue}[+]${endcolor} ${green}External IP: ${endcolor}$(curl -s ifconfig.co)\n"; echo
}
 
 
# View Apache logs
apachelog ()
{
	if [ -f /etc/httpd/conf/httpd.conf ]; then
		cd /var/log/httpd && ls -xAh && multitail --no-repeat -c -s 2 /var/log/httpd/*_log
	else
		cd /var/log/apache2 && ls -xAh && multitail --no-repeat -c -s 2 /var/log/apache2/*.log
	fi
}
 
 
source /home/kermit/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source /home/kermit/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/kermit/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh
#####################################################
# Auto completion / suggestion
# Mixing zsh-autocomplete and zsh-autosuggestions
# Requires: zsh-autocomplete (custom packaging by Parrot Team)
# Jobs: suggest files / foldername / histsory bellow the prompt
# Requires: zsh-autosuggestions (packaging by Debian Team)
# Jobs: Fish-like suggestion for command history
#if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
#  source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
#fi
 
##################################################
# Fish like syntax highlighting
# Requires "zsh-syntax-highlighting" from apt
#if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
#  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#fi
 
#if [ -f /usr/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh ]; then
#  source /usr/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
  # Select all suggestion instead of top on result only
  zstyle ':autocomplete:tab:*' insert-unambiguous yes
  zstyle ':autocomplete:tab:*' widget-style menu-select
  zstyle ':autocomplete:*' min-input 2
  bindkey $key[Up] up-line-or-history
  bindkey $key[Down] down-line-or-history
#fi
 
 
 
function funciones(){
  echo -e "\n\t${blue}[+]${endcolor} ${green}htbvpn${endcolor} Ejecuta la VPN descargada en ${red}/descargas/firefox${endcolor}"
  echo -e "\n\t${blue}[+]${endcolor} ${green}rmk${endcolor} Borra totalmente"
  echo -e "\n\t${blue}[+]${endcolor} ${green}target${endcolor} Fija un tarjet"
  echo -e "\n\t${blue}[+]${endcolor} ${green}scope${endcolor} Crea un target y directorios de trabajo"
  #echo -e "\n\t${blue}[+]${endcolor} ${green}finish${endcolor} Mata la VPN, sesion TMUX y borra directorios de trabajo" 
  echo -e "\n\t${blue}[+]${endcolor} ${green}xp${endcolor} Copia en la clipboard, ${red}ctrl + shift + v${endcolor} para pegar" 
  echo -e "\n\t${blue}[+]${endcolor} ${green}ports${endcolor} Muestra los puertos descubiertos de un archivo -oG de NMAP" 
  echo -e "\n\t${blue}[+]${endcolor} ${green}rot13${endcolor} Rota todos los caracteres 13 posiciones"
  echo -e "\n\t${blue}[+]${endcolor} ${green}whatismyip${endcolor} Muestra la ip publica"
  echo -e "\n\t${blue}[+]${endcolor} ${green}h${endcolor} Busca en el historial" 
  echo -e "\n\t${blue}[+]${endcolor} ${green}f${endcolor} Busca un archivo en el directorio actual" 
  echo -e "\n\t${blue}[+]${endcolor} ${green}ftext${endcolor} Busca una cadena entre los archivos del directorio actual" 
  echo -e "\n\t${blue}[+]${endcolor} ${green}extract${endcolor} Extrae un archivo comprimido\n" 
}

function vpn(){
  htbvpn 2>&1 &
  check
}
#funciones
function htbvpn(){
  sudo /usr/sbin/openvpn /home/kermit/Descargas/*.ovpn > /dev/null 2>&1
}

function check(){

  gum spin --spinner globe --title "Opening VPN..." -- sleep 8

  IFACE=$(/usr/sbin/ifconfig | grep tun0 | awk '{print $1}' | tr -d ':')
  IFACE2=$(/usr/sbin/ifconfig | grep tap0 | awk '{print $1}' | tr -d ':')

 
  if [ "$IFACE" = "tun0" ]; then
    ip1=$(/usr/sbin/ifconfig | grep tun0 -A1 | grep inet | awk '{print $2}')
    echo -e "\n\t${blue}[+]${endcolor} ${green}Success!${endcolor} your IP is: "
    gum style --foreground "#FF0000" --border-foreground "#00FF00" --border "rounded" --align center --width 20 --margin "1 1 1 8" --padding "1 0" $ip1
  else
    echo "Error"
  fi

}
 
function rmk(){
  scrub -p dod $1
  shred -zun 10 -v $1
}

function helpPanel(){
  echo -ne "\n\t${red}[!]${endcolor} Es necesario especificar ambos parametros"
  echo -ne "\n\n\t\t${blue}[+]${endcolor} Parametro ${red}-i${endcolor} especifica la ip"
  echo -ne "\n\t\t${blue}[+]${endcolor} Parametro ${red}-n${endcolor} especifica el nombre\n"
  tput cnorm; echo
 
}

function helpTarget(){
  echo -ne "\n\t\t${blue}[+]${endcolor} Parametro ${red}-i${endcolor} especifica la ip\n"
  echo -ne "\n\t\t${blue}[+]${endcolor} Parametro ${red}-n${endcolor} especifica el nombre\n"
  echo -ne "\n\t\t${blue}[+]${endcolor} Parametro ${red}-s${endcolor} especifica el sistema windows/linux\n"
  tput cnorm; echo
 
}

function helpMKT(){
  echo -ne "\n\t\t${blue}[+]${endcolor} Parametro ${red}-n${endcolor} especifica el nombre\n"
  echo -ne "\n\t\t${blue}[+]${endcolor} Parametro ${red}-p${endcolor} pin de la maquina\n"
  tput cnorm; echo
 
}

function target(){


  tput civis
  declare -i counter=0; while getopts "i:n:s:h:" arg; do
    case $arg in
      i) ip_address=$OPTARG; let counter+=1;;
      n) nombre_maquina=$OPTARG; let counter+=1;;
      s) sistema=$OPTARG; let counter+=1;;
      h) helpTarget;;
    esac
  done

  if [ $counter -ne 3 ]; then
    helpTarget
  else
    echo -ne "$ip_address" > /home/kermit/.config/bin/target.txt
    echo -ne "$nombre_maquina" > /home/kermit/.config/bin/target_sys.txt
    echo -ne "$sistema" > /home/kermit/.config/bin/ttl.txt
    export ip=$(/usr/bin/cat /home/kermit/.config/bin/target.txt)
    export name=$(/usr/bin/cat /home/kermit/.config/bin/target_sys.txt)
    echo -ne "\n\t${blue}[+]${endcolor} Name: ${red}$nombre_maquina${endcolor}\n" 
    echo -ne "\n\t${blue}[+]${endcolor} Ip: ${red}$ip_address${endcolor}\n"
    echo -ne "\n\t${blue}[+]${endcolor} System: ${red}$sistema${endcolor}\n"
    tput cnorm; echo
  fi
}


function tg(){
 
  tput civis
  gum input --prompt="> " --placeholder "ip de la maquina" > /home/kermit/.config/bin/target.txt
  gum input --prompt="> " --placeholder "nombre de la maquina" > /home/kermit/.config/bin/target_sys.txt
  gum choose "windows" "linux" > /home/kermit/.config/bin/ttl.txt

  ip_address=$(/usr/bin/cat /home/kermit/.config/bin/target.txt)
  nombre=$(/usr/bin/cat /home/kermit/.config/bin/target_sys.txt)
  sistema=$(/usr/bin/cat /home/kermit/.config/bin/ttl.txt)

  #echo -ne "$ip_address" > /home/kermit/.config/bin/target.txt
  #echo -ne "$nombre" > /home/kermit/.config/bin/target_sys.txt
  #echo -ne "$sistema" > /home/kermit/.config/bin/ttl.txt
  export ip=$(/usr/bin/cat /home/kermit/.config/bin/target.txt)
  export name=$(/usr/bin/cat /home/kermit/.config/bin/target_sys.txt)
  echo -ne "\n\t${blue}[+]${endcolor} Name: ${red}$nombre${endcolor}\n" 
  echo -ne "\n\t${blue}[+]${endcolor} Ip: ${red}$ip_address${endcolor}\n"
  echo -ne "\n\t${blue}[+]${endcolor} System: ${red}$sistema${endcolor}\n"
  tput cnorm; echo

}



function mkt(){
  
  tput civis
  declare -i counter=0; while getopts "n:p:h:" arg; do
    case $arg in
      n) nombre_maquina=$OPTARG; let counter+=1;;
      p) pin=$OPTARG; let counter+=1;;
      h) helpMKT;;
    esac
  done

  if [ $counter -ne 2 ]; then
    helpMKT
  else
    echo -e "\n\t${blue}[+]${endcolor} Creando directorios de trabajo...\n"
    mkdir /home/kermit/maquinas/$nombre_maquina
    mkdir /home/kermit/maquinas/$nombre_maquina/exploits
    mkdir /home/kermit/maquinas/$nombre_maquina/content
    touch /home/kermit/maquinas/$nombre_maquina/cred.txt
    touch /home/kermit/maquinas/$nombre_maquina/index.html
    chmod o+x /home/kermit/maquinas/$nombre_maquina/index.html
    cd /home/kermit/maquinas/$nombre_maquina
    echo -e "\n\t${blue}[+]${endcolor} Pined ${blue}/home/kermit/maquinas/$nombre_maquina ${endcolor}as ${red}$pin${end}\n"
    pin $pin
    tput cnorm; echo
  fi
}



function mk(){

  tput civis  
  gum input --prompt="> " --placeholder "nombre de la maquina" > machine.txt
  gum input --prompt="> " --placeholder "pin para el directorio" > pin.txt
  export machine=$(/usr/bin/cat ./machine.txt)
  export pin=$(/usr/bin/cat ./pin.txt)
  echo -e "\n\t${blue}[+]${endcolor} Creando directorios de trabajo...\n"
  mkdir /home/kermit/maquinas/$machine
  mkdir /home/kermit/maquinas/$machine/exploits
  mkdir /home/kermit/maquinas/$machine/content
  touch /home/kermit/maquinas/$machine/users
  touch /home/kermit/maquinas/$machine/notes.txt
  touch /home/kermit/maquinas/$machine/pass
  touch /home/kermit/maquinas/$machine/creds
  touch /home/kermit/maquinas/$machine/index.html
  chmod o+x /home/kermit/maquinas/$machine/index.html
  cd /home/kermit/maquinas/$machine 
  echo -e "\n\t${blue}[+]${endcolor} Pined ${blue}/home/kermit/maquinas/$machine ${endcolor}as ${red}$pin${end}\n"
  pin $pin
  tput cnorm; echo

}





function scope(){
 
  tput civis
  declare -i counter=0; while getopts "i:n:h:" arg; do
    case $arg in
      i) ip_address=$OPTARG; let counter+=1;;
      n) nombre_maquina=$OPTARG; let counter+=1;;
      h) helpPanel;;
    esac
  done
 
  if [ $counter -ne 2 ]; then
    helpPanel
  else
    echo -ne "\n\n\t${yellow}[?]${endcolor} Confirmando conexion VPN..."
    IFACE=$(/usr/sbin/ifconfig | grep tun0 | awk '{print $1}' | tr -d ':')
    
    if [ "$IFACE" = "tun0" ]; then
      htb_ip=$(/usr/sbin/ifconfig | grep tun0 -A1 | grep inet | awk '{print $2}')
      echo -ne "\n\n\t${blue}[+]${endcolor} Conexion con VPN establecida"
      echo -ne "\n\n\t${blue}[+]${endcolor} Ip VPN: ${blue}$(/usr/sbin/ifconfig tun0 | grep "inet " | awk '{print $2}')${endcolor}"
    else
      echo "\n\n\t${red}[!]${endcolor} Error al crear index.html, ip de interfaz tun0 no disponible"
    fi

    ttl="$(ping -c 1 $ip_address | grep ttl | tr '=' ' ' | awk '{print $8}')"
    if [ $? = "1" ]; then
      echo -e "\n\t${red}[!]${endcolor} Host ${red}$nombre_maquina${endcolor} inactivo"
      tput cnorm; exit 1
    else
      echo -e "\n\t${blue}[+]${endcolor} Host ${red}$nombre_maquina${endcolor} activo"
    fi
 
    echo -e "$nombre_maquina" > /home/kermit/.config/bin/target_sys.txt
 
    if [[ $ttl -le 64 ]]; then
      echo -e "\n\t${blue}[+]${endcolor} Sistema ${red}Linux  ${endcolor}"
      echo -e "linux" > /home/kermit/.config/bin/ttl.txt
    fi
    if [[ $ttl -le 128 && $ttl -gt 64 ]]; then
      echo -e "\n\t${blue}[+]${end} Sistema ${red}Windows  ${endcolor}"
      echo -e "windows" > /home/kermit/.config/bin/ttl.txt
    fi
    echo -ne "\n\t${blue}[+]${endcolor} Ip target: ${red}$ip_address ${endcolor}"
 
    echo "$ip_address" > /home/kermit/.config/bin/target.txt
    echo "$nombre_maquina" > /home/kermit/.config/bin/name.txt
 
    echo -ne "\n$ip_address\t$nombre_maquina.htb\n\n" >> /etc/hosts
    echo -e "\n\n\t${blue}[+]${endcolor} Añadido ${red}$nombre_maquina${endcolor} -> ${red}$ip_address${endcolor} al /etc/hosts..."
 
    echo -e "\n\t${blue}[+]${endcolor} Creando directorios de trabajo...\n"
    mkdir /home/kermit/maquinas/$nombre_maquina
    mkdir /home/kermit/maquinas/$nombre_maquina/exploits
    mkdir /home/kermit/maquinas/$nombre_maquina/recon
    touch /home/kermit/maquinas/$nombre_maquina/cred.txt
    touch /home/kermit/maquinas/$nombre_maquina/index.html
    chmod o+x /home/kermit/maquinas/$nombre_maquina/index.html
    cd /home/kermit/maquinas/$nombre_maquina
    echo "\n"
    export ip=$(/usr/bin/cat /home/kermit/.config/bin/target.txt)
    export name=$(/usr/bin/cat /home/kermit/.config/bin/name.txt)
    chown -R kermit:kermit /home/kermit/maquinas/
    tput cnorm
  fi
}


# funcion iiixgxgstrackckcttt porrrtttsss
function ports(){
  export ports="$(cat $1 | grep -oP '\d{1,5}/open' | awk '{print $1}' FS='/' | xargs | tr ' ' ',')"
  export ip_address="$(cat $1 | grep -oP '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' | sort -u | head -n 1)"
  #echo -e "\n${red}[*]${endcolor} ${green}Extracting information...${endcolor}\n" > extractPorts.tmp
  #echo -e "\t${red}[*]${endcolor} ${green}IP Address:${endcolor} $ip_address"  >> extractPorts.tmp
  echo $ports | tr -d '\n' | xclip -sel clip
  #/home/kermit/maquinas/Oouch/prueba.sh $ports $ip_address
  #source /home/kermit/scripts/bash/bashsimplecurses/simple_curses.sh
  #
  gum style --foreground "#FF0000" --border-foreground "#00FF00" --border "rounded" --align center --width 20 --margin "1 1 1 8" --padding "1 0" "IP: $ip_address"
  echo -e "\t${red}[*]${endcolor} Open ports: ${green}$ports${endcolor} \n"  >> extractPorts.tmp
  /usr/bin/cat extractPorts.tmp; /usr/bin/rm extractPorts.tmp
  echo -ne "\t${red}[*]${endcolor} Ports copied to clipboard\n"; echo 
  #/usr/bin/cat extractPorts.tmp; /usr/bin/rm extractPorts.tmp
}
#Funcion para cerrar sesion
function finish(){
 
tput civis
 
# Borrando /descargas/firefox
rm -rf /home/kermit/Descargas/firefox/*
echo -ne "\n\n\t${yellow}[$]${endcolor} Borrando descargas..."
if [ -z "$(ls -A /home/kermit/Descargas/firefox/)" ]; then
  echo "\n\n\t${blue}[+]${endcolor} Borradas correctamente"
else
  echo "\n\n\t${red}[!]${endcolor} Error al borrar /Descargas/firefox"
fi
 
echo "# Host addresses" > /etc/hosts
echo "#" >> /etc/hosts
echo "127.0.0.1  localhost" >> /etc/hosts
echo "127.0.1.1  parrot" >> /etc/hosts
echo -ne "\n\n\n" >> /etc/hosts
echo "::1        localhost ip6-localhost ip6-loopback" >> /etc/hosts
echo "ff02::1    ip6-allnodes" >> /etc/hosts
echo "ff02::2    ip6-allrouters" >> /etc/hosts
 
echo "\n\t${blue}[+]${endcolor} reconfigurado ${blue}/etc/hosts${endcolor}"
echo "\n\t${blue}[+]${endcolor} target ${red}$ip ${endcolor}deleted\n"
 
echo "" > /home/kermit/.config/bin/ttl.txt
echo "" > /home/kermit/.config/bin/target.txt
echo "" > /home/kermit/.config/bin/name.txt
 
tput cnorm
}
 
# Save type history for completion and easier life
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
#setopt appendhistory
setopt histignorealldups sharehistory 
# Useful alias for benchmarking programs
# require install package "time" sudo apt install time
# alias time="/usr/bin/time -f '\t%E real,\t%U user,\t%S sys,\t%K amem,\t%M mmem'"
# Display last command interminal
echo -en "\e]2;Parrot Terminal\a"
preexec () { print -Pn "\e]0;$1 - Parrot Terminal\a" }
 
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
 
# Created by `pipx` on 2022-10-23 17:28:32
export PATH="$PATH:/root/.local/bin"
 # Put the line below in ~/.zshrc:
#
#   eval "$(jump shell zsh)"
#
# The following lines are autogenerated:

__jump_chpwd() {
  jump chdir
}

jump_completion() {
  reply="'$(jump hint "$@")'"
}

j() {
  local dir="$(jump cd $@)"
  test -d "$dir" && cd "$dir"
}

typeset -gaU chpwd_functions
chpwd_functions+=__jump_chpwd

compctl -U -K jump_completion j
export PATH="${PATH}:/root/.cargo/bin"
