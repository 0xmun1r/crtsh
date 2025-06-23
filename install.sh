#!/bin/bash

echo "[*] Installing crtsh..."

sudo cp crtsh /usr/bin/crtsh
sudo chmod +x /usr/bin/crtsh

if command -v crtsh >/dev/null; then
    echo "[+] Installed successfully! Try:"
    echo "    crtsh -d example.com"
else
    echo "[-] Installation failed."
fi
