FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y openssl curl && \
    apt-get clean

RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod +x kubectl && \
    mv kubectl /usr/local/bin/
COPY /my-script.sh /app/my-script.sh
RUN chmod +x /app/my-script
