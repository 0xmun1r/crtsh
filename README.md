# 🔍 crtsh — Subdomain Recon Tool (crt.sh) by 0×mun1r

A fast, lightweight subdomain enumerator using crt.sh, built in pure Bash.

## 🛠 Features
- ✅ No dependencies except `curl`, `grep`, `sed`
- ✅ Supports single domain or list
- ✅ Silent mode and custom output

## 📦 Installation (Kali Linux / Debian)
```bash
git clone https://github.com/0xmun1r/crt.sh.git
cd crt.sh
chmod +x crtsh install.sh
./install.sh 

```

📌 Usage
```bash
crtsh -h.                          # help
crtsh -d example.com               # Single domain
crtsh -dL domains.txt              # List of domains
crtsh -d example.com -o output.txt      # Custom output
srt.sh -d example.com -s            # Silent mode
```
👤 Author

Made with ❤️ by 0×mun1r
