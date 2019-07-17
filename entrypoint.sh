#!/bin/sh
# generate ca
if [ ! -f "$CA_KEY" ]; then
  openssl genrsa -out "$CA_KEY" 4096
fi

if [ ! -f "$CA_CERT" ]; then
  openssl req -key "$CA_KEY" -new -x509 -days "$CA_EXPIRE" -sha256 -out "$CA_CERT" -extensions v3_ca -subj "$CA_SUBJECT"
fi

# generate cert
openssl genrsa -out "$TLS_KEY" 4096
openssl req -key "$TLS_KEY" -new -sha256 -out "$TLS_CSR" -subj "$TLS_SUBJECT"
openssl x509 -req -CA "$CA_CERT" -CAkey "$CA_KEY" -CAcreateserial -in "$TLS_CSR" -out "$TLS_CERT" -days "$TLS_EXPIRE"
