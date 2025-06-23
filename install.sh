#!/bin/bash

echo "[*] Installing crtsh by 0×mun1r..."

# Create ~/bin if not exists
mkdir -p "$HOME/bin"

# Copy crtsh script to ~/bin and make executable
cp crtsh "$HOME/bin/crtsh"
chmod +x "$HOME/bin/crtsh"

# Add ~/bin to PATH in ~/.bashrc if not already present
if ! grep -q 'export PATH="$HOME/bin:$PATH"' "$HOME/.bashrc"; then
    echo 'export PATH="$HOME/bin:$PATH"' >> "$HOME/.bashrc"
    echo "[*] Added ~/bin to PATH in ~/.bashrc"
else
    echo "[*] ~/bin already in PATH in ~/.bashrc"
fi

echo "[+] Installation complete."

echo "[!] Please restart your terminal or run 'source ~/.bashrc' to update your PATH."

echo "Usage examples:"
echo "    crtsh -d example.com"
echo "    crtsh -dL domains.txt -o output.txt"
