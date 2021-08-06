#!/bin/bash
declare -i i=1
while true
do
	echo "_______________"$i"_________________"
	git add .
	git commit -m "Update on wsaver/ Adding search by Voice "
	git push
	echo "Hi, bm7. A update has been done :)"
	i=$i+1
	echo "___________________________________"
	sleep 120
done
