#!/bin/bash
input="../.bash_history"
while IFS= read -r var
do
	echo "$var"
done < "$input"