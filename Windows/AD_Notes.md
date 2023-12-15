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
