#!/bin/bash

# 🛠 Subdomain Finder Tool - Enhanced
# 🔹 Author: Yash Tiwari
# 🔹 Usage: ./subdomain_finder.sh <domain>

# Check if a domain is provided
if [ -z "$1" ]; then
    echo -e "\n🔴 Usage: $0 <domain>\n"
    exit 1
fi

# Assign domain variable
DOMAIN=$1
OUTPUT_FILE="all_subdomains.txt"
TEMP_FILE="temp_subdomains.txt"

# Function to install missing tools
install_tool() {
    TOOL=$1
    INSTALL_CMD=$2

    if ! [ -x "$(command -v $TOOL)" ]; then
        echo -e "⚠️  $TOOL not found. Installing..."
        eval "$INSTALL_CMD"
    fi
}

# Install required tools if missing
install_tool "subfinder" "go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest"
install_tool "assetfinder" "go install -v github.com/tomnomnom/assetfinder@latest"
install_tool "amass" "go install -v github.com/OWASP/Amass/v3/...@latest"

# Start enumeration
echo -e "\n🔍 Starting subdomain enumeration for: $DOMAIN\n"

# Run tools in parallel
echo "▶️ Running subfinder..."
subfinder -d "$DOMAIN" -silent >> "$TEMP_FILE" &

echo "▶️ Running assetfinder..."
assetfinder --subs-only "$DOMAIN" >> "$TEMP_FILE" &

echo "▶️ Running amass..."
amass enum -passive -d "$DOMAIN" >> "$TEMP_FILE" &

# Wait for background processes to finish
wait

# Process results
echo -e "\n📌 Removing duplicates and saving results..."
sort -u "$TEMP_FILE" > "$OUTPUT_FILE"
rm "$TEMP_FILE"

echo -e "\n✅ Subdomain enumeration completed! Results saved in: $OUTPUT_FILE\n"

# Optional: Check for live subdomains
read -p "🔎 Do you want to check for live subdomains? (y/n): " answer
if [[ "$answer" == "y" ]]; then
    if ! command -v httpx &> /dev/null; then
        echo -e "⚠️  httpx not found. Installing..."
        go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
    fi
    echo -e "\n▶️ Checking live subdomains..."
    cat "$OUTPUT_FILE" | httpx -silent > "live_subdomains.txt"
    echo -e "\n✅ Live subdomains saved in: live_subdomains.txt\n"
fi
