#!/bin/bash

if [ "$EUID" -ne 0 ]; then
	echo "need root"
	exit 1
fi

if [ -z $1 ]; then
	echo "need address"
	exit 1
fi

sudo cp /etc/hosts /etc/hosts.add.bak

#entry=$(host $1 | grep -oE '[^ ]+$')
#entry="$entry\t$1"

#echo -e $entry >> /etc/hosts

if [ $(grep -c $1 /etc/hosts) -ne 0 ]; then
	echo "* $1 is already in your /ect/hosts file"
	exit 1
fi

entry="$(dig @8.8.8.8 $1 | grep -C 1 "ANSWER SECTION" | awk '{print $5}' | tr -d ' ' | tr -d '\n')\t$1"
echo -e $entry >> /etc/hosts
echo -e "* $entry has been successfully added to your /etc/hosts file. "
