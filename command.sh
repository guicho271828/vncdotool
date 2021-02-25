#!/bin/bash -x


vncserver -geometry 800x600

sleep 1800 &

handle (){
    echo "received $1; killing the child processes"
    kill $(jobs -p)
    pkill vncserver
}

for s in HUP TERM INT
do
    trap "handle $s" $s
done

wait
