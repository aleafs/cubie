#! /bin/bash

ipaddr() {
    local eth=$(/sbin/route -n | tail -n1 | awk '{print $NF}')
    /sbin/ifconfig | grep -A1 "${eth}" | grep inet | awk '{print $2}' | cut -d":" -f2
}

ipaddr
