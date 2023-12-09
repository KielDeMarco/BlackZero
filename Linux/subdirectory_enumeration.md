#Subdirectory Enumeration:

#### Use dig to do a zonetransfer:
```
dig axfr friendzone.red @10.10.10.123
```
#### Use gobuster for subdomain enumeration:
```
gobuster dns -d friendzone.red -w /usr/share/wordlists/dirb/common.txt
```
#### ffuf for subdomain enumeration:
```
ffuf -H "Host: FUZZ.devvortex.htb" -c -w "/usr/share/wordlists/seclists/Discovery/DNS/subdomains-top1million-20000.txt" -u http://devvortex.htb/portfolio.html

```
