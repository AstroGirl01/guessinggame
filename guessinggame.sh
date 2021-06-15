#!/usr/bin/env bash

clear
declare -i numFiles
numFiles=$(find . -maxdepth 1 -not -type d | wc --lines)

function makeAGuess {
	until read -p "Enter your guess:  " guess;
	[[ "$guess" =~ ^[0-9]+$ ]]; do
		echo -e "\nEnter positive number!\n"
	done
}

while makeAGuess; do
	if (( guess < numFiles )); then
		echo -e "\nYour guess is too low."
	elif (( guess > numFiles )); then
		echo -e "\nYour guess is too high."
	else
		echo -e "\nCongratulations! Answer $numFiles is correct!"
		exit
	fi
done

