#! /bin/bash

# Simple SYtem Scanner function.

function sisys() {
    figlet "Simple System Scanner "

    # This function (service_check) it analyzes common 
    # services used for remote access whether the service
    # is Running or Down.

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
}

function logger() {
    echo "Logger..."
}

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