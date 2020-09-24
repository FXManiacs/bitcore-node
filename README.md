# Bitcore Node

### Clone the repository:

```
git clone https://github.com/FXManiacs/bitcore-node.git
```

### Install docker and docker-compose packages

```
sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
	
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
   
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
```

### Download Bitcore:
```
sudo git clone https://github.com/bitpay/bitcore.git bitcore-src
```
*This will clone the repo into a bitcore-src*

### Copy all the cloned bitcore files into the bitcore-node/bitcore folder with option of not replacing (-n):
```
sudo cp -nr bitcore-src/* bitcore-node/bitcore
```

### Download the bitcoin-core tar and copy it to bitcore-node/bitcoin-core folder:
```
sudo wget -O bitcoin.tar.gz https://bitcoin.org/bin/bitcoin-core-0.20.1/bitcoin-0.20.1-x86_64-linux-gnu.tar.gz
sudo cp bitcoin.tar.gz bitcore-node/bitcoin-core
```
*Pay attention to the version*

### !! Modify all the necessary config files !!

- nginx.conf (from the bitcore-node)
- bitcore.config.json (from the bitcore-node/bitcore) (must be modified the password/username)
- bitcoin.conf and bitcoin.mainnet.conf (from the bitcore-node/bitcoin-core) (must be also modified the RPC username and RPC password)

*Pay attention to the addresses (which must be docker-compose services names, instead of some local ips (e.g.: bitcore-node:3000 instead of localhost:3000, etc.)*

### Run

Just execute the following command:
```
sudo docker-compose up -d
```

---------------------------------------------------------------------------------------------------------------------------------------------------------------------
## Useful commands
To stop start: sudo docker-compose start/stop
To display all the active containers:
```
sudo docker ps -a
```
To get logs of a specific container:
```
sudo docker logs -f [optional: --tail=1000] <container_id> or sudo docker-compose -f [optional: --tail=1000] <service name from the docker-compose file>
```
To run/rebuild a specific container:
```
sudo docker-compose up --no-deps [--build (in case of rebuild)] <container_name>
```
To execute any command in a container:
```
sudo docker ps -a (to get it's id (optional))

sudo docker exec -it <container_id>
or
sudo docker-compose exec -it <service name from the docker-compose file> *command*
```
To access a specific container using commandline:
```
sudo docker-compose exec -it <service name from the docker-compose file> bash
```
