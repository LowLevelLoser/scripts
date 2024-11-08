#!/bin/bash

#bc needs to be installed

expression=""

while true; do
	# Prompt the user to enter an expression with dmenu
	#expression=$(echo "$expression" | dmenu -p "Calc: ")
	expression=$(tac history.txt | dmenu -p "Calc (Press Tab to copy selection): " -fn "monospace:size=20")

	# If the user presses escape or enters nothing, break the loop
	[[ -z "$expression" ]] && break

		# Calculate the result using `bc`
	result=$(echo "scale=3; $expression" | bc -l 2>/dev/null)

	# Check if `bc` returned a valid result
	if [[ $? -eq 0 ]]; then
		# Display the result in dmenu so user can see it
		echo "($expression)" >> "history.txt"
		echo "$result" >> "history.txt"
		expression="$result"
	fi
done

""> "history.txt"
