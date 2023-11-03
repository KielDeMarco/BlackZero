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
###### List Current Processes:
```
ps aux | grep root
```
