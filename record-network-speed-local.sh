#!/bin/bash

# Write the current date to the text file
`date >> network-speed-record`

# Check network speed and write it to text file
eval "speedtest-cli | grep -iE \"Download:|Upload:\" >> network-speed-record"
