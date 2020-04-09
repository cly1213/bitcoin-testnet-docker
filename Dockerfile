FROM ubuntu:18.04

MAINTAINER leo <leochen@nctu.edu.tw>

RUN apt-get update
RUN apt-get install build-essential autoconf autotools-dev automake libtool pkg-config libboost-all-dev libssl-dev libprotobuf-dev protobuf-compiler libevent-dev libqt4-dev libcanberra-gtk-module libdb-dev libdb++-dev libboost-filesystem-dev libboost-chrono-dev libboost-test-dev libboost-thread-dev qt5-default qttools5-dev-tools libdb++-dev bsdmainutils vim git wget make python3 sudo -y

WORKDIR /src/bitcoin
COPY ./bitcoin .
RUN git checkout v0.17.1
RUN ./autogen.sh
RUN ./configure --with-incompatible-bdb
RUN make
RUN make install

# create a non-root user
RUN adduser --disabled-login --gecos "" tester

# run following commands from user's home directory
WORKDIR /home/tester

# copy the testnet-box files into the image
ADD . /home/tester/bitcoin-testnet-box

# make tester user own the bitcoin-testnet-box
RUN chown -R tester:tester /home/tester/bitcoin-testnet-box

# color PS1
RUN mv /home/tester/bitcoin-testnet-box/.bashrc /home/tester/ && \
	cat /home/tester/.bashrc >> /etc/bash.bashrc

# use the tester user when running the image
USER tester

# run commands from inside the testnet-box directory
WORKDIR /home/tester/bitcoin-testnet-box

# expose two rpc ports for the nodes to allow outside container access
EXPOSE 19001 19011
CMD ["/bin/bash"]
