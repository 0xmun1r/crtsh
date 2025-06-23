# 🔍 srt.sh — Subdomain Recon Tool (crt.sh) by 0×mun1r

A fast, lightweight subdomain enumerator using crt.sh, built in pure Bash (no `jq` dependency). Filters out lines with `@` and uppercase letters automatically.

## 🛠 Features
- ✅ No dependencies except `curl`, `grep`, `sed`
- ✅ Filters garbage (`@`, capital letters)
- ✅ Supports single domain or list
- ✅ Silent mode and custom output
- ✅ Pretty banner

## 📦 Installation (Kali Linux / Debian)
```bash
git clone https://github.com/YOUR_USERNAME/srt.sh.git && cd srt.sh && ./install.sh

Then just run:

srt.sh -d example.com

📌 Usage

srt.sh -d example.com               # Single domain
srt.sh -dL domains.txt              # List of domains
srt.sh -d nasa.gov -o nasa.txt      # Custom output
srt.sh -d example.com -s            # Silent mode

👤 Author

Made with ❤️ by 0×mun1r
