#!/bin/bash
echo "Enter target IP or domain:"
read TARGET
echo "Scanning $TARGET..."
nmap -A -T4 $TARGET > scan_results.txt
echo "Scan complete! Results saved in scan_results.txt"
