#!/bin/bash

echo "[*] Installing crtsh by 0×mun1r..."

# Ensure ~/bin exists
mkdir -p "$HOME/bin"

# Copy tool into ~/bin and rename to crtsh
cp crtsh "$HOME/bin/crtsh"
chmod +x "$HOME/bin/crtsh"

# Add to PATH if not already
if ! echo "$PATH" | grep -q "$HOME/bin"; then
    echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc
    source ~/.bashrc
fi

echo "[+] Installation complete. Use it by running:"
echo "    crtsh -d example.com"
