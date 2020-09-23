FROM node:10

ENV CONFIG_FILENAME bitcoin.conf

# Install Chrome

RUN echo 'deb http://dl.google.com/linux/chrome/deb/ stable main' > /etc/apt/sources.list.d/chrome.list

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -

RUN set -x \
    && echo CONFIG_FILENAME \
    && apt-get update \
    && apt-get install -y \
        libzmq3-dev build-essential google-chrome-stable

#Untar/link Bitcoin Core

COPY ./bitcoin.tar.gz ./bitcoin.tar.gz

RUN set -ex \
        && tar -xzvf bitcoin.tar.gz -C /usr/local --strip-components=1 --exclude=*-qt \
        && mkdir -p /home/btc-data \
        && ln -sfn /home/btc-data /root/.bitcoin

COPY ./docker-entrypoint.sh ./entrypoint.sh
COPY ./bitcoin*.conf /home/

VOLUME ["/home/btc-data"]
RUN chmod +x ./entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]
#ENTRYPOINT ["bitcoind", "-conf=/home/bitcoin.conf"]
