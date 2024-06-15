# Ldap enumeration:

#### Ldap enumeration with windapseawrch:
```
# Used incase required libraries are not installed on the system.

sudo apt-get install python3-dev libxml2-dev libxslt1-dev zlib1g-dev libsasl2-dev libldap2-dev build-essential libssl-dev libffi-dev libjpeg-dev libpq-dev liblcms2-dev libblas-dev libjpeg62-turbo-dev

git clone https://github.com/ropnop/windapsearch.git
pip install python-ldap
./windapsearch.py -U --full --dc-ip 10.10.10.182
```

#### For enumerating ldap and finding domain controllers:
```
ldapsearch -H ldap://10.10.10.161 -x -s base '' "(objectClass=*)" "*" + | grep dn
```
#### For user name enumeration
```
ldapsearch -H ldap://10.10.10.161 -x -b DC=htb,DC=local "(objectClass=person)" | grep "sAMAccountName:"
ldapsearch -H ldap://10.10.75.191 -x -b dc=baby,dc=vl "user" | grep dn
```
#### ldap password spray: 
```
crackmapexec smb 10.10.10.6 -u users.txt -p 'BabyStart123!' --no-bruteforce
```
####check user descriptions
```
ldapsearch -H ldap://10.10.10.161 -x -b DC=htb,DC=local "(objectClass=person)" | grep "grep desc -A2"
```
