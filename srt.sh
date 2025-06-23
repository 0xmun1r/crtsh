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

# Usage instructions
usage() {
    echo "Usage: $0 [-d domain] [-dL domain_list.txt] [-o output_file] [-s]"
    exit 1
}

# Initialize variables
domain=""
domain_list=""
output="srt_output.txt"
silent=false

# Parse args
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -d) domain="$2"; shift ;;
        -dL) domain_list="$2"; shift ;;
        -o) output="$2"; shift ;;
        -s) silent=true ;;
        *) echo "Unknown parameter passed: $1"; usage ;;
    esac
    shift
done

# Show banner
if [ "$silent" = false ]; then
    banner
fi

# Function to fetch, filter, display & save subdomains
fetch_subdomains() {
    local dom="$1"
    local outfile="$2"

    [ "$silent" = false ] && echo "[*] Enumerating subdomains for: $dom"

    # Grab and clean
    subs=$(curl -s "https://crt.sh/?q=%25.$dom&output=json" | \
        grep -oE '"name_value":"[^"]+"' | \
        sed -E 's/"name_value":"//' | \
        sed 's/\\n/\n/g' | \
        tr ',' '\n' | \
        sed 's/\r//g' | \
        grep -vE '[@A-Z]' | \
        sort -u)

    # Print to terminal unless silent
    if [ "$silent" = false ]; then
        echo "[+] Clean Subdomains Found:"
        echo "$subs"
    fi

    # Append to file
    echo "$subs" >> "$outfile"

    [ "$silent" = false ] && echo "[+] Done: $dom → $(echo "$subs" | wc -l) subdomains saved."
}

# Clear output
> "$output"

# Process domain(s)
if [ -n "$domain" ]; then
    fetch_subdomains "$domain" "$output"
elif [ -n "$domain_list" ]; then
    while IFS= read -r dom; do
        fetch_subdomains "$dom" "$output"
    done < "$domain_list"
else
    echo "[-] No domain or domain list provided."
    usage
fi

if [ "$silent" = false ]; then
    echo "[+] All clean subdomains saved to: $output"
fi
