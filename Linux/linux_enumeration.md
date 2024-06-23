###### OS Version:
```
 cat /etc/os-release
```
###### Find writable folders:
```
find / -path /proc -prune -o -type d -perm -o+w 2>/dev/null
```

###### Find writable files:
```
find / -path /proc -prune -o -type f -perm -o+w 2>/dev/null
```
###### Find cron jobs:
```
ls -la /etc/cron.daily/
```
###### Find files on a system:
```
find / -type f -name user.txt 2>/dev/null
```
##### Find config files:
```
find / ! -path "*/proc/*" -iname "*config*" -type f 2>/dev/null
```
###### List Current Processes:
```
ps aux | grep root
```
###### Find all hidden files.
```
find / -type f -name ".*" -exec ls -l {} \; 2>/dev/null | grep htb-student
```
######  Check for suid binaries.
```
find / -user root -perm -4000 -exec ls -ldb {} \; 2>/dev/null
```
```
 find / -perm /4000 -type f -exec ls -ld {} \; 2>/dev/null
```
