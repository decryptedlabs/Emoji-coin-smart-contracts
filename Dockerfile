FROM ubuntu:22.04

# Install necessary packages
RUN apt update && \
    DEBIAN_FRONTEND=noninteractive apt install -y \
    curl unzip wget git build-essential libssl-dev pkg-config ca-certificates

# Download and install Aptos CLI
RUN wget https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v7.2.0/aptos-cli-7.2.0-Ubuntu-22.04-x86_64.zip && \
    unzip aptos-cli-7.2.0-Ubuntu-22.04-x86_64.zip && \
    mv aptos /usr/local/bin/aptos && \
    chmod +x /usr/local/bin/aptos

# Set working directory
WORKDIR /aptos

# Set default command
ENTRYPOINT ["aptos"]
