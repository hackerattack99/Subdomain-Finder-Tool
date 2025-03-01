# 🌐 Subdomain Finder Tool

![Subdomain Finder](https://img.shields.io/badge/Subdomain-Finder-blue?style=for-the-badge)
![Bash Script](https://img.shields.io/badge/Made%20With-Bash-green?style=for-the-badge)
![Security Tool](https://img.shields.io/badge/Security-Tool-red?style=for-the-badge)

## 🔍 Overview
Subdomain-Finder-Tool is a powerful script that helps you discover subdomains of a target domain using multiple sources. It leverages **subfinder**, **assetfinder**, and **amass** to ensure comprehensive enumeration.

## 🚀 Usage
```bash
./subdomain_finder.sh <domain>
```

## ✨ Features
✅ Uses **subfinder**, **assetfinder**, and **amass** to find subdomains.  
✅ Merges results from all sources into a single file.  
✅ Saves the output in `all_subdomains.txt`.  

## 📦 Installation
### 1️⃣ Install Go:
```bash
sudo apt-get install golang
```

### 2️⃣ Install Required Tools:
```bash
go get -u github.com/projectdiscovery/subfinder/cmd/subfinder
go get -u github.com/tomnomnom/assetfinder
go get -u github.com/OWASP/Amass/v3/...
```

### 3️⃣ Make the Script Executable:
```bash
chmod +x subdomain_finder.sh
```

## ⚠️ Legal Disclaimer
> 🛑 This tool is for **educational and ethical purposes only**. The author is not responsible for any misuse or illegal activities related to this tool. Always obtain **proper authorization** before running any security tests.

---

💡 **Contributions & Issues**: Feel free to open a pull request or report an issue if you have suggestions for improvements! 🚀
