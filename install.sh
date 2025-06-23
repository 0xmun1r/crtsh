#!/bin/bash

echo "[*] Installing srtsh by 0×mun1r..."

mkdir -p "$HOME/bin"

cp srt.sh "$HOME/bin/srtsh"
chmod +x "$HOME/bin/srtsh"

if ! echo "$PATH" | grep -q "$HOME/bin"; then
    echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc
    source ~/.bashrc
fi

echo "[+] Installation complete. Run it with: srtsh -d example.com"
