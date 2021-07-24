#!/bin/bash
while true
do
	echo "_________________________________"
	git add -A
	git commit -am "Update on wsaver"
	git push
	sleep 30
	echo "Hi, bm7. A update has been done :)"
done
