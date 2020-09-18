FROM node:10

# Install Chrome

RUN echo 'deb http://dl.google.com/linux/chrome/deb/ stable main' > /etc/apt/sources.list.d/chrome.list

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -

RUN set -x \
    && apt-get update \
    && apt-get install -y \
        libzmq3-dev build-essential google-chrome-stable

RUN groupadd -r bitcoin && useradd -r -m -g bitcoin bitcoin

#Untar/link Bitcoin Core

COPY ./bitcoin.tar.gz ./bitcoin.tar.gz

RUN set -ex \
        && tar -xzvf bitcoin.tar.gz -C /usr/local --strip-components=1 --exclude=*-qt \
        && mkdir /data \
        && chown -R bitcoin:bitcoin /data \
        && ln -sfn /data /home/bitcoin/.bitcoin \
        && chown -h bitcoin:bitcoin /home/bitcoin/.bitcoin

VOLUME /data

COPY ./bitcoin.conf /data

EXPOSE 18332 18333

USER bitcoin

ENTRYPOINT ["bitcoind"]
