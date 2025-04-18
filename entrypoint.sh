#!/bin/bash
echo 1 > /proc/sys/net/ipv4/ip_forward

iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 8100
iptables -t nat -A PREROUTING -p tcp --dport 22 -j REDIRECT --to-port 2100
iptables -t nat -A PREROUTING -p tcp --dport 10000 -j REDIRECT --to-port 10100

tail -f /dev/null
