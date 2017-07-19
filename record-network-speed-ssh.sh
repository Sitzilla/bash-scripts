#!/bin/bash

# Assumes SSH keys are configured with the pi
USERNAME=pi
PORT=3336
HOSTNAME=sitzilla.mynetgear.com
SCRIPT="date >> network-speed-record"

check_connection() {
	if [ $? -ne 0 ]; then
		echo "SSH error into pi"
	else
		echo "PI connection successful"
	fi
}

# Write the current date to the Raspberry Pi
ssh -o ConnectTimeout=10 -l ${USERNAME} -p ${PORT} ${HOSTNAME} "${SCRIPT}"
check_connection

# Check network speed and write it to the Raspberry Pi
SCRIPT="speedtest-cli | grep -iE \"Download:|Upload:\" >> network-speed-record"
ssh -o ConnectTimeout=60 -l ${USERNAME} -p ${PORT} ${HOSTNAME} "${SCRIPT}"
check_connection
