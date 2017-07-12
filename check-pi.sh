#!/bin/bash

USERNAME=pi
PORT=3336
HOSTNAME=sitzilla.mynetgear.com
SCRIPT="pwd; ls"

ssh -o ConnectTimeout=10 -l ${USERNAME} -p ${PORT} ${HOSTNAME} "${SCRIPT}"

if [ $? -ne 0 ]; then
	echo "SSH error into pi"
else
	echo "PI connection successful"
fi
