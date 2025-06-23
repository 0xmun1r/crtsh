#!/bin/bash

# Banner
banner() {
cat << "EOF"
   ____  ____ _______     ______.___ _______ .__  __           
  / ___\/ ___\\   _  \   /  ___/|   |\      \|__|/  |_  ______ 
 / /_/  > /_/  >  /_\  \  \___ \ |   |/   |   \  \   __\/  ___/
/\___  /\___  /|  \_/   \/____  >|___/    |    \ ||  |  \___ \ 
/_____//_____/  \_____  /     \/      \____|__  /__| /____  >
                  0×mun1r | Subdomain Recon Tool | crt.sh   \/        
EOF
}

# Usage
usage() {
    echo "Usage: srtsh [-d domain] [-dL domain_list.txt] [-o output_file] [-s]"
    exit 1
}

# Vars
domain=""
domain_list=""
output="srtsh_output.txt"
silent=false

# Args
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -d) domain="$2"; shift ;;
        -dL) domain_list="$2"; shift ;;
        -o) output="$2"; shift ;;
        -s) silent=true ;;
        *) echo "Unknown parameter: $1"; usage ;;
    esac
    shift
done

# Banner
if [ "$silent" = false ]; then
    banner
fi

# Subdomain fetch function
fetch_subdomains() {
    local dom="$1"
    local outfile="$2"

    [ "$silent" = false ] && echo "[*] Enumerating subdomains for: $dom"

    subs=$(curl -s "https://crt.sh/?q=%25.$dom&output=json" | \
        grep -oE '"name_value":"[^"]+"' | \
        sed -E 's/"name_value":"//' | \
        sed 's/\\n/\n/g' | \
        tr ',' '\n' | \
        sed 's/\r//g' | \
        grep -vE '[@A-Z]' | \
        sort -u)

    if [ "$silent" = false ]; then
        echo "[+] Clean Subdomains Found:"
        echo "$subs"
    fi

    echo "$subs" >> "$outfile"

    [ "$silent" = false ] && echo "[+] Done: $dom → $(echo "$subs" | wc -l) subdomains saved."
}

# Start fresh
> "$output"

# Run
if [ -n "$domain" ]; then
    fetch_subdomains "$domain" "$output"
elif [ -n "$domain_list" ]; then
    while IFS= read -r dom; do
        fetch_subdomains "$dom" "$output"
    done < "$domain_list"
else
    echo "[-] No domain or list provided."
    usage
fi

[ "$silent" = false ] && echo "[+] Output saved to: $output"
