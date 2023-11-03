###### Find writable files:
```
find / -path /proc -prune -o -type f -perm -o+w 2>/dev/null
```
###### Find cron jobs:
```
ls -la /etc/cron.daily/
```
