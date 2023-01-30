#! /bin/bash

clear
figlet FOOTPRINTER
echo "MADE BY WHITE HAT "
echo "[+] ENTER WEBSITE TO RECON[+]:"
read  $WEBSITE

echo "SCANNING"
#Get Whois Infomation
whois $WEBSITE
sleep 0.5 
# Get NameServer Information
nslookup $WEBSITE
sleep 1.0
#Get DNS Information
dntracer $WEBSITE
sleep 1.0 
#Get DNS Mapping 
dnsmap $WEBSITE
sleep 1.0 
#Get LOAD BLALANCER Information
lbd $WEBSITE
sleep 0.5
#Get OPEN PORTS Information
nmap -v -F $WEBSITE
sleep 2.0
#Get SERVICES Information
nmap -v  -sV $WEBSITE
sleep 0.5 
#TCP SCAN 
nmap -v -sT $WEBSITE
sleep 1.5
#GET SUDOMAINS Information
knockpy $WEBSITE
sleep 0.5 
#Get DIRECTORY Information
dirb https://$WEBSITE
sleep 1.0
#Get Operating System Information
nmap -O $WEBSITE
sleep 0.5 
#Get Banner Grabbing Information
nc $WEBSITE 443
sleep 0.5
#Get available Directories Information
katana https://$WEBSITE
sleep 0.5
#Get Javascript Files Information
katana https://$WEBSITE -je
sleep 0.5
echo "HAPPY HUNTING "
exit 
