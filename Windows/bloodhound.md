Script I use to start bloodhound from docker

```
#!/bin/bash
xhost + && sudo docker run -it --rm -v $(pwd)/bloodhound:/bloodhound  -e DISPLAY=$DISPLAY --network host --device /dev/dri/card0 --name bloodhound bannsec/bloodhound --cpus="2" --oom-kill-disable --memory="4096"
```

Example Usage:
```
./bloodhound/bloodhound.sh
```
I create a folder called bloodhound and throw the script in their then run from the home directory.
