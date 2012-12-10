#!/bin/sh
SERVICE='apache2'
echo "enter the service you want to check"
read SERVICE
if ps ax | grep -v grep | grep $SERVICE > /dev/null
then
    echo "$SERVICE service running, everything is fine"
else
    echo "$SERVICE is not running"
    echo "$SERVICE is not running. Starting $SERVICE" | mail -s "$SERVICE down" root
  	gedit &
fi
