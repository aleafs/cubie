#! /bin/bash

export LANG=en_US.UTF-8

declare -r __PWD__=$(pwd)
declare -r __GIT__="/usr/bin/git"
declare -r APPROOT=$(cd -- $(dirname -- ${0}) && pwd)

getLanAddress() {
    local eth=$(/sbin/route -n | tail -n1 | awk '{print $NF}')
    /sbin/ifconfig | grep -A1 "${eth}" | grep inet | awk '{print $2}' | cut -d":" -f2
}

cd "${APPROOT}" && getLanAddress > ./ip && \
    ${__GIT__} add . && \
    ${__GIT__} commit -a -m "update ipaddress" && \
    ${__GIT__} push

cd ${__PWD__} && exit 0
