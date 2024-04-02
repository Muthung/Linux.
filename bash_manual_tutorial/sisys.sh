#!/bin/bash

figlet "Simple  System Scanner"

service_check() {
    name_service=$1
    if systemctl is-active --quiet "$name_service"; then
        echo " $name_service is running."
    else
        echo "$name_service is not running. DEFENSE."
        read -p "Next action or alert for $name_service: " action
        echo "Taking action: $action"
    fi
}

service_check "ssh"
service_check "apache2"
service_check "apache2"
service_check "vsftpd"
service_check "postfix"
service_check "dovecot"
service_check "dovecot"
service_check "bing9"
service_check "mysql"
service_check "xrdp"
service_check "smbd"
service_check "nmbd"