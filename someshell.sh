# This is the main function

function prompt()
{
	# miniProject > is the prompt shown everytime
	read -p 'miniProject > ' -r command_entered;
	if [[ "$command_entered" == "historypls" ]]; then
		echo -e "\nPrevious Commands\n";
		cat history_file;
		echo;
		return 0;
	fi
	if [[ "$command_entered" == "clearpls" ]]; then
		clearHistory;
		return 0;
	fi
	echo "$command_entered" >> history_file;
	# command $command_entered;
}

# this function is called when the interrupt signal is received

function toExit()
{
	echo -e "\nExiting Shell\n";
	exit 0;
}

function clearHistory()
{
	command > history_file
	echo -e "\n History cleared \n";
}

# Show acknowledgement when Interrupt signal is received (Ctrl+C)
trap toExit SIGINT;

# To run this everytime

while true; do
	prompt;
done
