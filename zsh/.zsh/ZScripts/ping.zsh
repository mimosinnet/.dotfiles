#!/usr/bin/env zsh
ping=(ping -c 2)
print "10 Network"
$ping 192.168.10.1
$ping 192.168.10.104
print "12 Network"
$ping 192.168.12.1
$ping 192.168.12.101
$ping 192.168.12.104
print "Container"
$ping 192.168.20.1
$ping 192.168.20.100
$ping 192.168.20.140
