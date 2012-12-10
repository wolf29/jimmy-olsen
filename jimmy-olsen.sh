#!/bin/bash
# 
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

SERVICE0='router'
SERVICE1='open-ils'
SERVICE2='cstore'
SERVICE3='clark' 

if ps ax | grep -v grep | grep $SERVICE0 > /dev/null
then
    echo "$SERVICE0 service running, everything is fine"
    #continue
else
    echo "$SERVICE0 is not running"
    echo "$SERVICE0 is not running!" | mail -s "$SERVICE0 down" root
    /openils/bin/osrf_ctl.sh -l -a start_router 
fi

if ps ax | grep -v grep | grep $SERVICE1 > /dev/null
then
    echo "$SERVICE1 service running, everything is fine"
    #continue
else
    echo "$SERVICE1 is not running"
    echo "$SERVICE1 is not running!" | mail -s "$SERVICE1 down" root
    /openils/bin/osrf_ctl.sh -l -a start_perl 
fi

if ps ax | grep -v grep | grep $SERVICE2 > /dev/null
then
    echo "$SERVICE2 service running, everything is fine"
    #continue
else
    #echo "$SERVICE2 is not running"
    echo "$SERVICE2 is not running!" | mail -s "$SERVICE2 down" root
    /openils/bin/osrf_ctl.sh -l -a start_c 
fi

if ps ax | grep -v grep | grep $SERVICE3 > /dev/null
then
    echo "$SERVICE3 service running, everything is fine"
    #continue
else
    #echo "$SERVICE3 is not running"
    echo "$SERVICE3 is not running!" | mail -s "$SERVICE3 down" root
    rm /tmp/reporter-LOCK
    /openils/bin/clark-kent.pl -d -c 2 
    
fi
