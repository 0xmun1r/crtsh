#!/bin/bash

echo "[*] Installing srt.sh by 0×mun1r..."

# Ensure bin folder exists
mkdir -p $HOME/bin

# Download or move script to ~/bin and make executable
cp srt.sh $HOME/bin/srt.sh
chmod +x $HOME/bin/srt.sh

# Add to PATH if not already
if ! echo "$PATH" | grep -q "$HOME/bin"; then
    echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc
    source ~/.bashrc
fi

echo "[+] Installed successfully. Run with: srt.sh -d example.com"
