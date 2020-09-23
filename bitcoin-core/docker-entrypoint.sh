#!/bin/bash
echo ${CONFIG_FILENAME}
if [ "${CONFIG_FILENAME}" = "bitcoin.mainnet.conf" ]; then
  mv /home/bitcoin.mainnet.conf /home/bitcoin.conf
fi;

bitcoind -conf=/home/bitcoin.conf
