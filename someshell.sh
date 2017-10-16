function prompt()
{
    someps1=$(echo -e "\033[1msomeone@someshell >\033[0m ");
    read -p "$someps1"  -r foo;
    if [[ "$foo" == "historypls" ]]; then
        echo -e "\nPrevious Commands\n";
        cat history_file;
        echo;
        return 0;
    fi
    echo "$foo" >> history_file;
    command $foo;
}

function bar()
{
    echo -e "\nExiting Shell\n";
    exit 0;
}

# Show acknowledgement when Interrupt signal is received
trap bar SIGINT;

rm -f history_file;

while true; do
    prompt;
done
