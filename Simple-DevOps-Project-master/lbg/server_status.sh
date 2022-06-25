#!/bin/bash
server_ip=$1
ping $server_ip -c 1
if [ $? -eq 0]
then
echo "$server_ip is up"
else
echo "$server_ip is not running"
fi


