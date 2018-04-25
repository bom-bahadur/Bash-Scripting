#!/bin/bash

# To run script in all nodes, without copying it using for loop.

for i in ukwfssymp{001..004}
do
	ssh root@$i 'cat | bash /dev/stdin' "$@" < "script name"
	
done


