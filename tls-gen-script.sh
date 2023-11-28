#!/bin/bash

# Step 1: Generate a Private Key and Certificate Signing Request (CSR)
openssl genpkey -algorithm RSA -out private.key
openssl req -new -key private.key -out csr.pem

# Step 2: Generate a Self-Signed Certificate
openssl x509 -req -in csr.pem -signkey private.key -out certificate.crt

# Step 3: Create a Kubernetes Secret
kubectl create secret tls my-secret-name \
  --cert=certificate.crt \
  --key=private.key \
  --namespace=my-namespace

# Optional: Verify the Secret
kubectl get secret your-secret-name -n my-namespace
kubectl describe secret your-secret-name -n my-namespace

# Step 4: After Getting Secret Ready, Let's Delete the Certificate, Private Key and CSR Files If Not Needed Anymore
rm certificate.crt
rm private.key
rm csr.pem
