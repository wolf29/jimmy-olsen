#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
#       jimmy_olsen.py
#       install /openils/bin/
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
import os

def main():
        s = sysuser()
#
def sysuser():
        if os.system('/bin/ps aux | grep -i router | wc -l' < 2):
		 os.system('/openils/bin/osrf_ctl.sh -a restart_router')
	if os.system('/bin/ps aux | grep -i open-ils | wc -l' < 2):
		os.system('/openils/bin/osrf_ctl.sh -a restart_perl')
        if os.system('/bin/ps aux | grep -i cstore | wc -l' < 2):
		os.system('/openils/bin/osrf_ctl.sh -a restart_c')
			
	if os.system('ps aux | grep -i clark | wc -l' < 2):
		os.system('rm /tmp/reporterLOCK*')
		os.system('/openils/bin/clark_kent -d -c 6')


main()
