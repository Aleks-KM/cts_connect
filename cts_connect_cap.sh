#!/usr/bin/env bash

[ "$1" == "start" ] && cts connect -auto &     
sleep 8    

while true : 
do
        ss -ua | grep "IP_ADRES:PORT" &>/dev/null
        if
                [ $? -eq 0 ] 
        then
                :      
        else
                cts disconnect && cts connect -auto &  
        fi
        sleep 2s 
done

[ "$1" == "stop" ] && cts disconnect   
sleep 3s 
