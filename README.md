# Subdomain-Finder-Tool

This tool finds subdomains for a given domain using multiple sources. It uses `subfinder`, `assetfinder`, and `amass`.

## Usage

```bash
./subdomain_finder.sh <domain>

#Features

Finds subdomains using subfinder, assetfinder, and amass.
Combines the results from all sources into a single file.
Saves the results in all_subdomains.txt.

#Installation

Install Go:

#bash

sudo apt-get install golang
Install subfinder, assetfinder, and amass:

#bash

go get -u github.com/projectdiscovery/subfinder/cmd/subfinder
go get -u github.com/tomnomnom/assetfinder
go get -u github.com/OWASP/Amass/v3/...
Make the script executable:

#bash

chmod +x subdomain_finder.sh

#WARNING: LEGAL DISCLAIMER
This tool is for educational and ethical purposes only. The author is not responsible for any misuse or damage caused by this tool. Always obtain proper authorization before testing any tools.


