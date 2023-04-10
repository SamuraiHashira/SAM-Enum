#!/bin/bash

# Welcome message
echo "Welcome to SAMX Enumeration Tool"

# Create new folder and prompt user for folder name
echo "Enter folder name for project: "
read folder_name
mkdir "$folder_name"
cd "$folder_name"

# Create new file for subdomains and prompt user for domain name

echo "Enter domain name to enumerate subdomains: "
read domain_name
touch "$domain_name.txt"

# Run Subfinder to get subdomains and output to file

echo "Running Subfinder..."
subfinder -d "$domain_name" >> "$domain_name.txt"

# Use httpx to check which subdomains are working

echo "Checking subdomains with httpx..."
httpx -l "$domain_name.txt" -silent -o final_Subs.txt

# Use Nuclei to check for vulnerabilities on subdomains with 200 status code

echo "Checking subdomains with Nuclei..."
cat temp.txt | nuclei  -l final_Subs.txt -o nuclei_output.txt

# Clean up temporary files

rm temp.txt
