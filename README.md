# 🌐 Subdomain Finder Tool

![Subdomain Finder](https://img.shields.io/badge/Subdomain-Finder-blue?style=for-the-badge)
![Bash Script](https://img.shields.io/badge/Made%20With-Bash-green?style=for-the-badge)
![Security Tool](https://img.shields.io/badge/Security-Tool-red?style=for-the-badge)

---

## 🚀 Overview
Subdomain-Finder-Tool is a powerful and efficient script that helps you discover subdomains for a target domain using multiple sources. It leverages **subfinder**, **assetfinder**, and **amass** to provide comprehensive subdomain enumeration.

🔹 **Fast & Efficient** – Uses multiple tools in parallel for quick results.  
🔹 **Easy to Use** – Just run the script and get your results.  
🔹 **Highly Reliable** – Combines results from trusted sources to ensure accuracy.  

---

## 🎯 Usage
```bash
./subdomain_finder.sh <domain>
```
Example:
```bash
./subdomain_finder.sh example.com
```

---

## ✨ Features
✅ Uses **subfinder**, **assetfinder**, and **amass** to find subdomains.  
✅ Merges results from all sources into a single file.  
✅ Saves the output in `all_subdomains.txt`.  
✅ Lightweight and fast execution.  
✅ Perfect for security researchers & bug bounty hunters.  

---

## 📦 Installation

### 1️⃣ Install Go:
```bash
sudo apt-get install golang
```

### 2️⃣ Install Required Tools:
```bash
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install -v github.com/tomnomnom/assetfinder@latest
go install -v github.com/OWASP/Amass/v3/...@latest
```

### 3️⃣ Make the Script Executable:
```bash
chmod +x subdomain_finder.sh
```

---

## ⚠️ Legal Disclaimer
> 🛑 **This tool is for educational and ethical purposes only.** The author is not responsible for any misuse or illegal activities related to this tool. Always obtain **proper authorization** before running any security tests.

---

## 📢 Contributions & Issues
Got an idea for improvement? Found a bug? Feel free to **open an issue** or **submit a pull request**! Let's build something awesome together! 🚀

