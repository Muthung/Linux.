#!/bin/bash

figlet "Simple  System Scanner"

service_check() {
    name_service=$1
    if systemctl is-active --quiet "$name_service"; then
        echo " $name_service is running."
    else
        echo ""
        echo -e ">>> $name_service is down. DEFENSE."
        echo ""
        read -p ">>> Next action or alert for $name_service: " action
        echo ""
        echo "Taking action: $action"
    fi
}

service_check "SSH"
service_check "APACHE2"
service_check "APACHE2"
service_check "VSFTPD"
service_check "POSTFIX"
service_check "DOVECOT"
service_check "BING9"
service_check "MySQL"
service_check "XRDP"
service_check "SMBD"
service_check "SMBD"