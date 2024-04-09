#! /bin/bash

# Simple System Scanner function.

# The function (service_check) it analyzes common 
# services used for remote access whether the service
# is Running or Down.

function sisys() {
    figlet "Simple System Scanner "



    service_check() {
        name_service=$1
        if systemctl is-active --quiet "$name_service"; then
            echo " $name_service is running. "
        else
            echo ""
            echo -e ">>> $name_service is down. DEFENSE!!!."
            echo ""
            read -p ">>> Press Enter for the next service: " action
            echo ""
            echo "Checking... Done. $action"
        fi
    }

    service_check "SSH"
    service_check "APACHE2"
    service_check "VSFTPD"
    service_check "POSTFIX"
    service_check "DOVECOT"
    service_check "BING9"
    service_check "MySQL"
    service_check "XRDP"
    service_check "SMBD"

    exit 0
}

function logger() {
    # Note that there are ather log files in /var/log not affected
    # by this script.

    DIR_LOG=/var/log
    ROOT_UID=0      # Only users with $UID 0 have root privileges.
    LINES=50        # Default number of lines saved.
    E_XCD=86        # Can't change direcory?.
    E_NOTROOT=87    # Non-root exit error.

    # Run as root.
    if [ "$UID" -ne "$ROOT_UID" ]
    then
        echo "Must be root to run this script."
        exit $E_NOTROOT
    fi

    if [ -n "$1" ]
    # Test whether command line argument is prresent (non-empty).
    then
        lines=$1
    else
        lines=$LINES        # Default, if not specified on command-line.
    fi

    cd $DIR_LOG || {
        echo "Cannot change to necessary directory. " >&2
        exit $E_XCD;
    }

    tail -n $lines messages > mesg.temp         # Saves last section of message log file.
    mv mesg.temp system_log_file

    cat /dev/null > wtmp        # ': > wtmp' and '> wtmp' have the same effect.
    echo "Log files successfully cleaned."

    exit 0
    # A zero return value from the script upon exit indicate success to the shell.
}

# Quit the program.

function Quit() {
    echo "Done."
    exit 0
}

function mainMenu() {
    PS3="Select an option: "
    options=("Sisys." "Logger." "Quit.")
    select opt in "${options[@]}"
    do
        case $opt in
            "Sisys"*)
                sisys
            ;;
            "Logger"*)
                logger
            ;;
            "Quit"*)
                Quit
            ;;
            *)
                echo "Invalid"
            ;;
        esac
    done
}

# Call the main menu function to start the script
mainMenu