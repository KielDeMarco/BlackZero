#### Notes for active directory:

If a user belongs to the Remote Management USers group we can gain access to the machine through evil-winrm.
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
####shows groups user belongs to:
```
whoami /all
```
