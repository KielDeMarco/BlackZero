#Subdirectory Enumeration:

#### Use dig to do a zonetransfer:
```
dig axfr friendzone.red @10.10.10.123
```
#### Use gobuster for subdomain enumeration:
```
gobuster dns -d friendzone.red -w /usr/share/wordlists/dirb/common.txt
```
