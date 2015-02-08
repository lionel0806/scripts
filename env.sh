#!/bin/sh
#
# This shell script is to install some software and configure env.
# Author: lixian 
# Data: 2015/2/7
#

LOG_FILE="./install.log"

################################function####################
function log {
	echo $1 >> $LOG_FILE
}

function install_sw {
	for i in $*;
	do
		echo "Now start install $i ......"
		yum install -y $i
		if [ $? -ne 0 ]; then
			log "Install $i error"
		fi
		echo "Install $i finish." 
	done
}

############################################################

user_id=`id -u`
if [ $user_id -ne 0 ]; then
	echo "Oops! U should exec this script as root !"
	exit 0
fi

install_sw git git-core
install_sw mariadb  mariadb-devel mariadb-server

exit 0    
