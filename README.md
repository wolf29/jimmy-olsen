jimmy-olsen
===========

Jimmy is Clark Kent's Best Friend. He checks all the openSRF processes on an evergreen-ILS server and then if Clark is not running, he gives him a wake-up call.  What better friend could a reporter have?

By default clark-kent.pl is started as daemon with 6 child processes.
/openils/bin/clark-kent.pl -d -c 6

There needs to be a cron job set for jimmy-olsen - The line below makes jimmy-olsen check every 5 minutes
5 * * * * /openils/bin/jimmy-olsen.py


To Do: stackoverflow.com/questions/38056/how-do-you-check-in-linux-with-python-if-a-process-is-still-running help with the PID-discovery issue