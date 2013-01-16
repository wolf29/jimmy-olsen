#!/bin/bash 
# -x
#  -*- coding: utf-8 -*-
#
#       jimmy_olsen.sh
#       install into /openils/bin/
#       
#       Copyright 2012 Wolf Halton <wolf@sourcefreedom.com>
#       
#       This program is free software; you can redistribute it and/or modify
#       it under the terms of the GNU General Public License as published by
#       the Free Software Foundation; either version 2 of the License, or
#       (at your option) any later version.
#       
#       This program is distributed in the hope that it will be useful,
#       but WITHOUT ANY WARRANTY; without even the implied warranty of
#       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#       GNU General Public License for more details.
#       
#       You should have received a copy of the GNU General Public License
#       along with this program; if not, write to the Free Software
#       Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#       MA 02110-1301, USA.

SERVICE3='clark' 

# 	Reduced functionality from jimmy-olsen-1, which also monitors
#	openSRF functions.  You cannot bring up the services as quickly as
#	jimmy-olsen-1.sh wants them to go.

if  ps aux | grep -v grep | grep -i "${SERVICE3}" > /dev/null 
then
    echo "$SERVICE3 service running, everything is fine"
    
else
    echo "$SERVICE3 is not running"
    echo "$SERVICE3 is not running!" | mail -s "$SERVICE3 down" root
    rm /tmp/reporter-LOCK
    /openils/bin/clark-kent.pl -d -c 2 
    
fi
