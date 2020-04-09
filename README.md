# bitcoin-testnet-docker

## Ubuntu 18.04

```bash
## clone the bitcoin repository
$ git clone https://github.com/bitcoin/bitcoin.git

## change folders
$ cd bitcoin

## check which versions are available
$ git tag

## find your desired version in the list, and then 'checkout'
$ git checkout v0.17.1

## now you can build:
$ ./autogen.sh
$ ./configure
$ ./make
$ sudo make install
```

