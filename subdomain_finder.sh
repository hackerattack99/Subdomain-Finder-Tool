#!/bin/bash

# Subdomain Finder Tool
# Author: WhiteRabbitNeo
# Usage: ./subdomain_finder.sh <domain>

# Check if a domain was provided
if [ -z "$1" ]; then
    echo "Usage: ./subdomain_finder.sh <domain>"
    exit 1
fi

# Domain to search for subdomains
domain=$1

# Check if subfinder is installed
if ! [ -x "$(command -v subfinder)" ]; then
    echo "Error: subfinder is not installed."
    echo "Installing subfinder..."
    go get -u github.com/projectdiscovery/subfinder/cmd/subfinder
fi

# Check if assetfinder is installed
if ! [ -x "$(command -v assetfinder)" ]; then
    echo "Error: assetfinder is not installed."
    echo "Installing assetfinder..."
    go get -u github.com/tomnomnom/assetfinder
fi

# Check if amass is installed
if ! [ -x "$(command -v amass)" ]; then
    echo "Error: amass is not installed."
    echo "Installing amass..."
    go get -u github.com/OWASP/Amass/v3/...
fi

# Find subdomains using subfinder
echo "Finding subdomains using subfinder..."
subfinder -d $domain -o subfinder_output.txt

# Find subdomains using assetfinder
echo "Finding subdomains using assetfinder..."
assetfinder $domain | grep $domain >> assetfinder_output.txt

# Find subdomains using amass
echo "Finding subdomains using amass..."
amass enum -d $domain -o amass_output.txt

# Combine results
echo "Combining results..."
cat subfinder_output.txt assetfinder_output.txt amass_output.txt | sort -u > all_subdomains.txt

# Clean up
rm subfinder_output.txt assetfinder_output.txt amass_output.txt

echo "Subdomain finding completed. Results saved in all_subdomains.txt"
