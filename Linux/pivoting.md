##### SSH local portforward:
```
ssh -L 1234:localhost:3306 -L 8080:localhost:80 ubuntu@10.129.202.64
```

##### Dynamic portforwarding for proxy chains:
```
ssh -D 9050 ubuntu@10.129.202.64
```

##### To check /etc/proxychains.conf:
```
tail -4 /etc/proxychains.conf
```

##### using nmap with proxy chains
```
proxychains nmap -v -sn 172.16.5.1-200
```
```
proxychains nmap -v -Pn -sT 172.16.5.19
```
#### metasploit with proxychains:
```
proxychains msfconsole
```
##### rdp_scanner with metasploit:
```
search rdp_scanner
```

##### xfree rpd with proxychains:
```
proxychains xfreerdp /v:172.16.5.19 /u:victor /p:pass@123
```
