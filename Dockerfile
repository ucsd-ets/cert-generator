FROM frapsoft/openssl

COPY entrypoint.sh /entrypoint.sh
RUN mkdir -p /certs
WORKDIR /certs
ENV CA_SUBJECT="/CN=test-ca" \
    CA_KEY=ca.key \
    CA_CERT=ca.crt \
    CA_SRL=ca.srl \
    CA_EXPIRE=7300 \
    TLS_SUBJECT="/CN=example.com" \
    TLS_CERT=tls.crt \
    TLS_KEY=tls.key \
    TLS_CSR=tls.csr \
    TLS_EXPIRE=365

ENTRYPOINT /entrypoint.sh

