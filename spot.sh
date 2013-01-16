#!/bin/sh

#
#  spot.sh
#  Spot looks for service names in processes.  Spot is Jimmy Olsen's 
#   birddog.
#   Spot will flush them out and let you know the service is running.
#   If the service is not running, Spot can send an email that the 
#   service is down.
#   
#   Usage 
#	$ spot.sh <Process-name>
#  
#  Copyright 2013 halton <wolf@sourcefreedom.com>
#  
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#  
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA 02110-1301, USA.
#  
#  
SERVICE='apache2'
echo "enter the service you want to check"
read SERVICE
if ps ax | grep -v grep | grep $SERVICE > /dev/null
then
    echo "$SERVICE service running, everything is fine"
else
    echo "$SERVICE is not running"
    echo "$SERVICE is not running. Starting $SERVICE" | mail -s "$SERVICE down" root
  	
fi
