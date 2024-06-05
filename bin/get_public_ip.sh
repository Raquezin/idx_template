#!/bin/bash

# Get public IP address using an online service
public_ip=$(curl -s ifconfig.me)

# Specify the output file
output_file="my_ip.txt"

# Write the IP address to the file
echo $public_ip > $output_file
