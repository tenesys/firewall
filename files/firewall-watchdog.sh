#!/bin/bash

current=`iptables-save | sed -r "s/\[[0-9]+:[0-9]+\]//g" | grep -vE "^#"`

diff <(echo -e "$current") /var/lib/ansible-firewall
exit $?

