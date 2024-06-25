#!/bin/bash
startdate=2020-01-01
enddate=2020-12-31
d=
n=0
until [ "$d" = "$enddate" ]; do
  d=$(date -d "$startdate + $n days" +%Y-%m-%d)
  wget http://10.10.10.248/documents/$d-upload.pdf
  ((n++))
done
