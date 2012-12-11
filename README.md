jimmy-olsen
===========

Jimmy is Clark Kent's Best Friend. He checks all the openSRF processes on an evergreen-ILS server and then if Clark is not running, he gives him a wake-up call.  What better friend could a reporter have?

By default clark-kent.pl is started as daemon with 6 child processes.
/openils/bin/clark-kent.pl -d -c 2 

There needs to be a cron job set for jimmy-olsen - The line below makes jimmy-olsen check every 5 minutes
5 * * * * /openils/bin/jimmy-olsen.sh

===========================
Jimmy-olsen.sh brings up only clark-kent.pl

Jimmy-olsen-1.sh has the ability to bring up all the OSRF services, but is too fast.  He needs a crosscheck or a rest period between to allow the services time to initiate themselves fully.


