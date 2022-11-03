#!/bin/bash

message="$1"
MYIP=$(ip addr show ens3 | grep "inet " | sed -e "s/.* inet //g" | sed -e "s/\/.*//g")
PARENT=$(tr -d "\0" </proc/$PPID/cmdline)

URL="https://discordapp.com/api/webhooks/950693006233727046/XeWWAw7jrNqmOaWM7fE52-_w5xEE0XUUUmjLbscDWH6t8196UvYsc6YlXB756y-8277H"

USERNAME="Bookface [$HOSTNAME / $MYIP] $PARENT"

if echo $USERNAME | grep "/var/lib/cloud/"; then
USERNAME="Bookface [$HOSTNAME / $MYIP] cloud-init"
fi

USERNAME=$( echo $USERNAME | sed -e "s/\/bin\/bash//" )

JSON="{\"username\": \"$USERNAME\", \"content\": \"$message\"}"

curl -s -X POST -H "Content-Type: application/json" -d "$JSON" $URL
