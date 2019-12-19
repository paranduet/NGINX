#!/bin/bash   
###################################################################################
#	Author: H.M. Shah Paran Ali
#	OS Environment: RHEL 6.0 and above
#	Description: Load Balancer (NGINX) restart with its status checking script
#	Email: paran.duet@gmail.com
####################################################################################

cd /usr/local/nginx/sbin/

########## Status Check #######
./nginx -t

./nginx -s stop

fuser 80/tcp -k

./nginx

echo " Process Status of Current LB"
echo "==============================="
ps -ef | grep -i nginx

cd ~
###### Check NGINX Status ##############
if [ -e /usr/local/nginx/logs/nginx.pid ]; then 
	echo "nginx is running"; 
else
	echo "nginx is not running";
fi