#!/bin/bash

dir_path=~/workspace/*

for path in ${dir_path}; do	
	if [ -d ${path} ]; then
		if [ -e ${path}/.git  ]; then
			echo "Updating git for ${path##*/}"
			cd ${path}
        		git pull
		fi
	fi
done

