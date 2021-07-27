#!/bin/bash
declare -i i=1
while true
do
	echo "_______________"$i"_________________"
	git add -A
	git commit -am "Update on wsaver/ Adding and enabling search optio on left Side"
	git push
	sleep 30
	echo "Hi, bm7. A update has been done :)"
	i=$i+1
done
