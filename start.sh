#!/bin/bash
/root/wlp/bin/server start server1 --clean 

curl http://127.0.0.1:10200/daytrader/config?action=resetTrade &
sleep 10

cd /root/apache-jmeter-3.0/bin; ./jmeter -n -t daytrader7.jmx -JHOST=127.0.0.1 -JPORT=10200 -JTHREADS=2 -j /tmp/jmeter.log -JDURATION=60 &
sleep 70

Threads=10
cd /root/apache-jmeter-3.0/bin; ./jmeter -n -t daytrader7.jmx -JHOST=127.0.0.1 -JPORT=10200 -JTHREADS=$Threads -j /tmp/jmeter.log -JDURATION=120 &
sleep 130

Run_Time=600
cd /root/apache-jmeter-3.0/bin; ./jmeter -n -t daytrader7.jmx -JHOST=127.0.0.1 -JPORT=10200 -JTHREADS=$Threads -JDURATION=$Run_Time 

