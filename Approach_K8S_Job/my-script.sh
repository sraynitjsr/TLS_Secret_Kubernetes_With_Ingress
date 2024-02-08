#!/bin/bash

echo "Variable MY_IP is set to $MY_IP"

openssl genrsa -out myspace-tls.key 4096

openssl req -x509 -new -nodes -key myspace-tls.key -sha256 -days 365000 -out myspace-tls.crt -subj /C=US/ST=CA/L=TX/O=SSOL/OU=FNC/CN=*.$MY_IP.nip.io

kubectl create secret tls myspace-tls --key=myspace-tls.key --cert=myspace-tls.crt -n myspace
