#! /bin/bash

export LANG=en_US.UTF-8

declare -r __PWD__=$(pwd)
declare -r APPROOT=$(cd -- $(dirname -- ${0}) && pwd)

ipaddr() {
    local eth=$(/sbin/route -n | tail -n1 | awk '{print $NF}')
    /sbin/ifconfig | grep -A1 "${eth}" | grep inet | awk '{print $2}' | cut -d":" -f2
}

ipaddr > "${APPROOT}/ip" && git add . && git commit -a -m "update ipaddress" && git push

cd ${__PWD__}
