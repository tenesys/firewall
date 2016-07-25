# README.md
# Ansible Role: firewall

An Ansible role that manages iptables configuration with script for monitoring.
IPv4 only.

## Requirements

Just iptables-enabled kernel and Debian/Ubuntu operating system.

## Role Variables

Available variables are listed below, along with default values:

    firewall_ruleset: []
    firewall_default_input: accept
    firewall_default_output: accept
    firewall_default_forward: accept

You will need to create some own variables with custom rulesets.

    fw_common:
      accept: 
        - {src: 192.168.0.0/24}
        - {src: 10.20.30.40/32, dport: 80}
        - {proto: icmp}
    
You can use: src, dst, sport, dport, iface, proto
Available dicts: accept, drop, log

Then you can define your firewall_ruleset: `["{{fw_common}}", "{{fw_webserver}}"]`  

Rules are evaluated from left to right, from top to bottom.

Default rules are: ACCEPT on loopback, ACCEPT for established and related packets.

## Firewall watchdog
In /usr/local/sbin/firewall-watchdog you can find useful script for comparing active rules with saved ones. Difference will be printed on standard output, you can also check exit code. If it's 0, then there were no changes. 

## License

GPLv3
