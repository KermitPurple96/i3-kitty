# ~/.config/fish/config.fish

# Colors
set -g endcolor "\033[0m\e[0m"
set -g green "\e[0;32m\033[1m"
set -g red "\e[0;31m\033[1m"
set -g blue "\e[0;34m\033[1m"
set -g yellow "\e[0;33m\033[1m"
set -g purple "\e[0;35m\033[1m"
set -g turquoise "\e[0;36m\033[1m"
set -g gray "\e[0;37m\033[1m"
set -g negro "\e[0;30m\033{1m"
set -g fondonegro "\e[0;40m\033[1m"
set -g fondoverde "\e[0;42m\033[1m"
set -g fondoamarillo "\e[0;43m\033[1m"
set -g fondoazul "\e[0;44m\033[1m"
set -g fondopurple "\e[0;46m\033[1m"
set -g fondogris "\e[0;47m\033[1m"


echo -ne "\t   __                    __                   __            
\t _/ /________  __       / /__________________/ /_________
\t/  __/ ___/ / / /      / __  / __  / ___/ __  / _  / ___/
\t/ /_/ /  / /_/ /      / / / / /_/ / /  / /_/ /  __/ /
\t\__/_/  _\__  /      /_/ /_/\__,_/_/  /_____/\___/_/   
\t       /_____/ \n" | lolcat
echo




# Export PATH
set -g PATH $PATH /home/kermit/.local/bin /usr/bin /usr/share/responder /usr/share/ghidra /usr/share/hydra /usr/share/libreoffice /snap/bin /usr/sandbox /usr/local/bin /usr/local/go/bin /bin /usr/local/games /usr/games /usr/share/games /usr/local/sbin /usr/sbin /sbin /usr/local/bin /bin /usr/local/games /usr/games /home/kermit/.fzf/bin /opt/exploitdb /root/.local/bin /home/kermit/scripts/bash /home/kermit/scripts/python /usr/share/metasploit-framework/tools/exploit /usr/bin/arsenal /usr/bin/gtfo /home/kermit/.fzf/bin /usr/share/Wordpresscan /root/.local/pipx/shared/bin /root/go/bin /home/kermit/go/bin /usr/bin/pwsh /home/kermit/kitty.app/bin /home/kermit/dev/python /home/kermit/dev/python/shellpy /home/kermit/dev/python/support /home/kermit/dev/python/shellpy /home/kermit/dev/bash /home/kermit/dev/go

# Set other environment variables
set -gx ip (cat /home/kermit/.config/bin/target.txt)
set -gx name (cat /home/kermit/.config/bin/target_sys.txt)
set -gx _JAVA_AWT_WM_NONREPARENTING 1
set -gx wpscan (cat /home/kermit/wpscan_key)
set -gx wpscan (cat /home/kermit/shodan_key)
set -gx PDCP_API_KEY (cat /home/kermit/CVEmap_key)

#source /home/kermit/dev/bash/bashsimplecurses/simple_curses.sh

function kroot
    /home/kermit/kitty.app/bin/kitty &>/dev/null &
    disown
end



function recon
    locate .nse | grep "$argv" | sed 's|/usr/share/nmap/scripts/||' >>/tmp/nmap.tmp
    set archivo /tmp/nmap.tmp
    set lineas (wc -l < $archivo)
    echo -e (set_color blue)"\n\t[+] "(set_color normal)"$lineas scripts found\n"
    for linea in (cat $archivo)
        echo -e (set_color green)"\t[+] "(set_color normal)"$linea \n"
    end
    set scripts (locate .nse | grep "$argv" | sed 's|/usr/share/nmap/scripts/||' | tr '\n' ',' | xargs)
    set scripts2 (string trim -c ',' $scripts)
    echo "$scripts2" | xp >/dev/null 2>&1
    rm $archivo
end





# Agrega esta función a tu .config.fish

function getips
    # Verifica si se proporcionó un archivo como argumento
    if test (count $argv) -eq 0
        echo "Uso: getips <archivo>"
        return 1
    end

    # Guarda el archivo proporcionado en una variable
    set archivo $argv[1]

    # Verifica si el archivo existe
    if not test -f $archivo
        echo "El archivo '$archivo' no existe."
        return 1
    end

    # Extrae las direcciones IP usando grep con una expresión regular
    grep -oE '\b([0-9]{1,3}\.){3}[0-9]{1,3}\b' $archivo | sort -u | uniq
end



function getips6
    # Verifica si se proporcionó un archivo como argumento
    if test (count $argv) -eq 0
        echo "Uso: getips6 <archivo>"
        return 1
    end

    # Guarda el archivo proporcionado en una variable
    set archivo $argv[1]

    # Verifica si el archivo existe
    if not test -f $archivo
        echo "El archivo '$archivo' no existe."
        return 1
    end

    # Extrae las direcciones IPv6 usando grep con una expresión regular
    grep -oE '(([0-9a-fA-F]{1,4}:){7,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,7}:|([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:)|fe80:(:[0-9a-fA-F]{0,4}){0,4}%[0-9a-zA-Z]{1,}|::(ffff(:0{1,4}){0,1}:){0,1}((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])|([0-9a-fA-F]{1,4}:){1,4}:((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9]))' $archivo | sort -u | uniq
end

function rmk
    scrub -p dod $argv[1]
    shred -zun 10 -v $argv[1]
end



function extract
    for archive in $argv
        if test -f $archive
            switch $archive
                case "*.tar.bz2"
                    tar xvjf $archive
                case "*.tar.gz"
                    tar xvzf $archive
                case "*.bz2"
                    bunzip2 $archive
                case "*.rar"
                    rar x $archive
                case "*.gz"
                    gunzip $archive
                case "*.tar"
                    tar xvf $archive
                case "*.tbz2"
                    tar xvjf $archive
                case "*.tgz"
                    tar xvzf $archive
                case "*.zip"
                    unzip $archive
                case "*.Z"
                    uncompress $archive
                case "*.7z"
                    7z x $archive
                case "*"
                    echo "don't know how to extract '$archive'..."
            end
        else
            echo "'$archive' is not a valid file!"
        end
    end
end



function get
    # Verifica si se proporcionaron los argumentos necesarios
    if test (count $argv) -lt 2
        echo "Uso: get <n campo> <archivo> [FS]"
        return 1
    end

    # Guarda los argumentos en variables
    set campo $argv[1]
    set archivo $argv[2]
    set FS ","

    # Si se proporciona el tercer argumento, úsalo como FS
    if test (count $argv) -ge 3
        set FS $argv[3]
    end

    # Verifica si el archivo existe
    if not test -f $archivo
        echo "El archivo '$archivo' no existe."
        return 1
    end

    # Usa awk para imprimir el campo especificado con el delimitador especificado
    awk -v campo=$campo -v FS="$FS" '{print $campo}' $archivo
end



set -gx IFACE (/usr/sbin/ifconfig | grep tun0 | awk '{print $1}' | tr -d ':')
set -gx IFACE2 (/usr/sbin/ifconfig | grep tap0 | awk '{print $1}' | tr -d ':')




if test "$IFACE" = tun0
    set -gx miip (/usr/sbin/ifconfig | grep tun0 -A1 | grep inet | awk '{print $2}')
    echo -e (set_color green)"\t[+]"(set_color normal)" VPN tun0 interface detected \n"
else
    echo -e (set_color red)"\t[-]"(set_color normal)" No VPN tun0 interface detected \n"
end

if test "$IFACE2" = tap0
    set -gx miip (/usr/sbin/ifconfig | grep tap0 -A1 | grep inet | awk '{print $2}')
    echo -e (set_color green)"\t[+]"(set_color normal)" VPN tap0 interface detected \n"
else
    echo -e (set_color red)"\t[-]"(set_color normal)" No VPN tap0 interface detected \n"
end




set -gx miipk (/usr/sbin/ifconfig | grep eth0 -A1 | grep inet | awk '{print $2}')

function mipk
    echo $miipk
end

function mip
    echo $miip
end

function ipt
    echo $ip
end

function ipn
    echo $name
end

function xp
    xclip -sel clip
end

function hexen
    echo "$argv" | xxd -p
end

function hexde
    echo "$argv" | xxd -p -r
end

function rot13
    echo "$argv" | tr A-Za-z N-ZA-Mn-za-m
end

function pin
    jump pin $argv[1]
end

function unpin
    jump unpin $argv[1]
end


function fibtrie
    cat $argv[1] | grep LOCAL -B 1 | grep -oP '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' | sort -u
end



function share
    echo -ne "\n\t[+] Sharing at:"
    echo -ne "\n\n\t"

    # Verificar si mip no está vacía y ejecutar el comando correspondiente
    if test -n (mip)
        echo "\\\\$(mip)\\$argv[1]"
    end

    # Verificar si mipk no está vacía y ejecutar el comando correspondiente
    if test -n (mipk)
        echo "\\\\$(mipk)\\$argv[1]"
    end

    echo -ne "\n"
    impacket-smbserver $argv[1] (pwd) -smb2support
end

function serve
    python3 -m uploadserver $argv[1]
end



# ~/.config/fish/config.fish
alias montar='sudo vmhgfs-fuse .host:/D /mnt/hgfs/ -o allow_other -o uid=1000'
# Alias
alias dockerrmc='docker rm (docker ps -a -q) --force'
alias dockerrmi='docker rmi (docker images -q)'
alias dockerrmv='docker volume rm (docker volume ls -q)'

#alias share='impacket-smbserver share (pwd) -smb2support'
alias sd="sudo su"
alias fz='nvim (fzf --preview="cat {}")'
#alias serve='python3 -m http.server $argv[1]'
alias clean='sed -e "s/\x1b\[[0-9;]*m//g"'

function neofetch
    command neofetch --source /home/kermit/ascii | lolcat
end

function urlencode
    python3 -c 'import sys, urllib.parse as ul; print(ul.quote_plus(sys.argv[1]))' $argv
end

function urldecode
    python3 -c 'import sys, urllib.parse as ul; print(ul.unquote_plus(sys.argv[1]))' $argv
end

function burpro
    java --illegal-access=permit -Dfile.encoding=utf-8 -javaagent:/home/kermit/Desktop/Burp-Suite/loader.jar -noverify -jar /home/kermit/Desktop/Burp-Suite/Burp_Suite_Pro.jar &
end

alias kitten="kitty +kitten icat"
alias pins='jump pins'
alias js='js-beautify'


zoxide init fish | source


# ~/.config/fish/config.fish

# Aliases for zoxide
alias x='z'
alias xi='zi'
alias xr='zoxide remove'
alias xq='zoxide query'
alias xe='zoxide edit'
alias xa='zoxide add'

# Aliases for common commands
alias a='run'
alias v='nvim'

# Multiple directory listing commands
alias la='lsd -Aalh' # show hidden files
alias ls='lsd -aFh --color=always' # add colors and file type extensions
alias lx='lsd -lXBh' # sort by extension
alias lk='lsd -lSrh' # sort by size
alias lc='lsd -lcrh' # sort by change time
alias lu='lsd -lurh' # sort by access time
alias lr='lsd -lRh' # recursive ls
alias lt='lsd -ltrh' # sort by date
alias lm='lsd -alh | more' # pipe through 'more'
alias lw='lsd -xAh' # wide listing format
alias ll='lsd -Fls' # long listing format
alias labc='lsd -lap' # alphabetical sort
alias lf='lsd -l | egrep -v "^d"' # files only
alias ldir='lsd -l | egrep "^d"' # directories only

# Other common aliases
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Navigation shortcuts
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Search commands
alias h='history | grep'
alias p='ps aux | grep'
alias topcpu='/bin/ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10'
alias f='find . | grep'

# File and directory operations
#alias countfiles='for t in files links directories; echo (find . -type $t | wc -l) $t; end 2>/dev/null'
#alias countfiles 'for t in files links directories; echo (find . -type $t | wc -l | tr -d " ") $t; end 2>/dev/null'
alias checkcommand='type -t'

# Network commands
#alias ipview="netstat -anpl | grep :80 | awk '{print \$5}' | cut -d\":\" -f1 | sort | uniq -c | sort -n | sed -e 's/^ *//' -e 's/ *\$//'"
alias openports='netstat -nape --inet'

# Reboot aliases
alias rebootsafe='sudo shutdown -r now'
alias rebootforce='sudo shutdown -r -n now'

# Disk and space information
alias diskspace='du -S | sort -n -r | more'
alias folders='du -h --max-depth=1'
alias folderssort='find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn'
alias tree='tree -CAhF --dirsfirst'
alias treed='tree -CAFd'
alias mountedinfo='df -hT'

# Logs
#alias logs='sudo find /var/log -type f -exec file {} + | grep "text" | cut -d" " -f1 | sed -e "s/:$//" | grep -v "[0-9]$" | xargs tail -f'


# mkdir lab
# nmap -sn
# getips 
# multiscan
# ports
# tg
# mk
# stop


function method
    echo "mkdir lab"
    echo "nmap -sn 192.168.1.0/24 -oG ips.nmap"
    echo "getips ips.nmap"
    echo "multiscan ips"
    echo "mutlifast ips"
    echo "ports nmap.txt"
    echo tg
    echo mk
    echo stop
end

function multiscan
    if test (count $argv) -eq 0
        echo "Uso: multiscan <archivo_de_ips>"
        return 1
    end

    set file $argv[1]
    for ip in (cat $file)
        set formatted_ip (echo $ip | tr '.' '_')

        echo "Escaneando IP: $ip"
        nmap -sS --open -p- $ip -n -Pn -oG nmap_$formatted_ip.txt -vvv
    end
end

function multifast
    if test (count $argv) -eq 0
        echo "Uso: multifast <archivo_de_ips>"
        return 1
    end

    set file $argv[1]
    for ip in (cat $file)
        set formatted_ip (echo $ip | tr '.' '_')

        echo "Escaneando IP: $ip"
        fast $ip >nmap_$formatted_ip.txt
    end
end


function ports
    set ports (cat $argv[1] | grep -oP '\d{1,5}/open' | awk '{print $1}' FS='/' | xargs | tr ' ' ',')
    set ncports (cat $argv[1] | grep -oP '\d{1,5}/open' | awk '{print $1}' FS='/' | xargs)
    #set ip_address (cat $argv[1] | grep -oP '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' | sort -u | head -n 1)
    set ip_address (cat $argv[1] | grep -oP '^Host: .* \(\)' | head -n 1 | awk '{print $2}')
    set red (set_color red)
    set green (set_color green)
    set endcolor (set_color normal)

    echo "nmap -sCV -p $ports $ip_address -n -oN SCV_$ip_address.txt" | tr -d '\n' | xclip -sel clip

    gum style --foreground "#FF0000" --border-foreground "#00FF00" --border rounded --align center --width 20 --margin "1 1 1 8" --padding "1 0" "IP: $ip_address"
    echo -e "\t$red [*]$endcolor Open ports: $green $ports$endcolor \n" >extractPorts.tmp
    /usr/bin/cat extractPorts.tmp
    /usr/bin/rm extractPorts.tmp

    echo -ne "\t$green [+]$endcolor Scripts scans"
    echo
    echo -ne "\t$yellow [!]$endcolor Copied to de clipboard\n $endcolor"
    echo
    echo -ne "\t$red [*]$endcolor nmap -sCV -p $ports $ip_address -n -oN SCV_$ip_address.txt"
    echo
    echo -ne "\t$red [*]$endcolor nmap --script 'vuln and exploit and intrusive' -p $ports $ip_address -n -Pn -oN vulns.nmap"
    echo
    echo -ne "\n\t$green [+]$endcolor IPv6 scan"
    echo
    echo -ne "\t python IOXIDResolver.py -t $ip_address"
    echo
    echo -ne "\t$red [*]$endcolor nmap -p- -sS --open -vvv -n -Pn -6 <ipv6 >%eth0 -oG ipv6.nmap"
    echo
    echo -ne "\n\t$green [+]$endcolor UDP scans"
    echo
    echo -ne "\t$red [*]$endcolor nmap -sU --top-ports 100 --open -v -n $ip_address -oG udp.ports"
    echo
    echo -ne "\t$red [*]$endcolor nmap -sCV -p161 -sU $ip_address -oN udpScan.nmap"
    echo
    echo -ne "\n\t$green [+]$endcolor Automated scans"
    echo
    echo -ne "\t$red [*]$endcolor enum4linux -a $ip_address"
    echo
    echo -ne "\t$red [*]$endcolor autorecon $ip_address"
    echo
    echo -ne "\t$red [*]$endcolor nc -nvv -w 1 -z $ip_address $ncports"
    echo
    echo -ne "\t$red [*]$endcolor nc -nv -u -z -w 1 $ip_address $ncports"
    echo
    echo -ne "\t$red [*]$endcolor incursore.sh -t All -H $ip_address"
    echo
    echo -ne "\n\t$green [+]$endcolor Recommended scans"

    echo -ne "\n\t Run$green recon <protocol>$endcolor to get nmap scripts"

    if echo $ports | grep -q '\b21\b'
        echo -ne "\n\t ftp $ip_address"
    end
    if echo $ports | grep -q '\b43\b'
        echo -ne "\n\t whois $ip_address"
        echo -ne "\n\t whois <domain> -h $ip_address"
    end
    if echo $ports | grep -q '\b43\b'
        echo -ne "\n\t whois $ip_address"
        echo -ne "\n\t whois <domain> -h $ip_address"
    end
    if echo $ports | grep -q '\b53\b'
        echo -ne "\n\t dnsenum --dnsserver $ip_address--threads 50 -f /usr/share/SecLists/Discovery/DNS/subdomains-top1million-5000.txt <domain>"
        echo -ne "\n\t dnsrecon -n 192.168.198.254 -d relia.com -t std,axfr,brt"
    end
    if echo $ports | grep -q '\b80\b'
        echo -ne "\n\t nmap --script http-enum -p80 $ip_address"
        echo -ne "\n\t wfuzz -c --hc=404 -t 200 -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt $ip_address/FUZZ"
        echo -ne "\n\t gobuster dir -u $ip_address -w /usr/share/seclists/Discovery/Web-Content/directory-list-2.3-medium.txt -t 20 -x html,php,txt"
    end
    if echo $ports | grep -q '\b123\b'
        echo -ne "\n\t ntpdate -s $ip_address"
    end
    if echo $ports | grep -qE '\b(135|137|139)\b'
        echo -ne "\n\t impacket-rpcdump $ip_address -p <port>"
        echo -ne "\n\t rpcclient -U "" $ip_address -N"
    end
    if echo $ports | grep -q '\b161\b'
        echo -ne "\n\t onesixtyone $ip_address -c usr/share/SecLists/Discovery/SNMP/common-snmp-community-strings.txt -i ips"
        echo -ne "\n\t snmpwalk -v2c -c public $ip_address"
        echo -ne "\n\t snmpbulkwalk -v2c -c public $ip_address"
    end
    if echo $ports | grep -q '\b443\b'
        echo -ne "\n\t openssl s_client -connect $ip_address:443"
    end
    if echo $ports | grep -q '\b445\b'
        echo -ne "\n\t nbtscan -r $ip_address"
        echo -ne "\n\t nxc smb $ip_address --shares"
        echo -ne "\n\t smbclient -N -L "
        echo "\\\\\\\\$ip_address\\\\"
        echo -ne "\t smbmap -H $ip_address"
    end


    echo -ne "\n"
    echo
end



function tg
    tput civis

    set session_start_time (date +%s)
    echo $session_start_time >/home/kermit/.config/bin/session.txt

    set -l NEWLINE "\n"

    gum input --prompt="> " --placeholder "ip de la maquina" >/home/kermit/.config/bin/target.txt
    gum input --prompt="> " --placeholder "nombre de la maquina" >/home/kermit/.config/bin/target_sys.txt
    gum choose windows linux >/home/kermit/.config/bin/ttl.txt

    set ip_address (cat /home/kermit/.config/bin/target.txt)
    set nombre (cat /home/kermit/.config/bin/target_sys.txt)
    set sistema (cat /home/kermit/.config/bin/ttl.txt)

    set -x ip (cat /home/kermit/.config/bin/target.txt)
    set -x name (cat /home/kermit/.config/bin/target_sys.txt)

    echo -e "\n\t$blue [+]$endcolor Name: $red $nombre$endcolor\n"
    echo -e "\n\t$blue [+]$endcolor Ip: $red $ip_address$endcolor\n"
    echo -e "\n\t$blue [+]$endcolor System: $red $sistema$endcolor\n"

    tput cnorm

end



function mk
    tput civis
    gum input --prompt="> " --placeholder "workspace name" >machine.txt
    gum input --prompt="> " --placeholder /path/to/create/files >path.txt
    set machine (cat ./machine.txt)
    set workspace (cat ./path.txt)
    set blue (set_color blue)
    set endcolor (set_color normal)
    set green (set_color green)
    echo -e "\n\t$blue [+]$endcolor Creating workspace...\n"
    mkdir $workspace/$machine
    mkdir $workspace/$machine/tools
    mkdir $workspace/$machine/exploits
    mkdir $workspace/$machine/payloads
    mkdir $workspace/$machine/content
    mkdir $workspace/$machine/server
    touch $workspace/$machine/scope
    touch $workspace/$machine/hash
    touch $workspace/$machine/users
    touch $workspace/$machine/notes.txt
    touch $workspace/$machine/pass
    touch $workspace/$machine/creds
    touch $workspace/$machine/words
    touch $workspace/$machine/index.html
    chmod o+x $workspace/$machine/index.html
    cd $workspace/$machine
    echo -e "\n\t$blue [+]$endcolor Added $green$workspace/$machine $endcolor to zoxide"
    xa $workspace/
    tput cnorm
    echo
end



function stop
    # Limpiar el prompt y desactivar el contador de tiempo
    set -e session_start_time
    rm /home/kermit/.config/bin/session.txt
    echo "Session stopped. Time counter deactivated."
end




function ftext
    # -i case-insensitive
    # -I ignore binary files
    # -H causes filename to be printed
    # -r recursive search
    # -n causes line number to be printed
    # optional: -F treat search term as a literal, not a regular expression
    # optional: -l only print filenames and not the matching lines ex. grep -irl "$1" *
    grep -iIHrn --color=always "$argv[1]" . | less -r
end

function cpp
    set -e
    strace -q -ewrite cp -- "$argv[1]" "$argv[2]" 2>&1 | awk '
  {
    count += $NF
    if (count % 10 == 0) {
      percent = count / total_size * 100
      printf "%3d%% [", percent
      for (i=0; i<=percent; i++)
        printf "="
      printf " >"
      for (i=percent; i<100; i++)
        printf " "
      printf "]\r"
    }
  }
  END { print "" }' total_size=(stat -c '%s' "$argv[1]") count=0
end

function cd
    if test -n "$argv[1]"
        builtin cd $argv
        and lsd -A
    else
        builtin cd ~
        and ls -A
    end
end



# Save type history for completion and easier life
set -U fish_history_file ~/.local/share/fish/fish_history
set -U fish_history_max_count 10000

# Append history from other shells
set -U fish_append_history true

# Ignore duplicate entries in history
set -U fish_history_ignore_dups true

# Share history across fish sessions
set -U fish_share_history true


set -U fish_greeting (set_color blue) "       glu glu 🐟"(set_color normal)



if status is-interactive
    atuin init fish | source
    # Commands to run in interactive sessions can go here
end

# Created by `pipx` on 2024-07-13 13:34:55
set PATH $PATH /root/.local/bin
