# bitcoin-testnet-docker

A Docker container for the Bitcoin-testnet

Ubuntu 18.04

Bitcoin Core version 0.17.1

## Usage
```git clone https://github.com/cly1213/bitcoin-testnet-docker.git```

```cd bitcoin-testnet-docker```

```git clone https://github.com/bitcoin/bitcoin.git```

```sudo docker build -t bitcoin-testnet-docker . --no-cache```

```sudo docker run -t -i --name="bitcoin-testnet" bitcoin-testnet-docker /bin/bash```



