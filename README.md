# bitcore-node

Install docker and docker-compose packages

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

Download Bitcore (clone repo, git clone https://github.com/bitpay/bitcore.git bitcore-src and copy everything from the bitcore-src to bitcore folder) and Bitcoin Node (tar, and rename it to bitcoin.tar.gz)
- to download the bitcore archive: sudo wget -O bitcoin.tar.gz https://bitcoin.org/bin/bitcoin-core-0.20.1/bitcoin-0.20.1-x86_64-linux-gnu.tar.gz
-- pay attention to the version
Create a folder - bitcoin with 2 folders in it: bitcore (contains everything from the cloned repo) and bitcoin-core (and copy the bitcoin.tar.gz there)
Move the created docker-compose.yml to the bitcoin folder.
Move the Bitcore's Dockerfile to the bitcore folder
Move Insight's Dockerfile to packages/Insight
Copy configs to their folders (bitcoin.conf to bitcoin-core folder, bitcore.config.json to the bitcore folder, insight/ionic.config.json to the bitcore/packages/insight folder)
Pay atention to the addresses from these config files, as instead of local ips must be container names (e.g: bitcore-node:3000 instead of localhost:3000/127.0.0.1:3000, etc.)
Move the nginx.conf file to the bitcore folder
Move the Bitcoin Core Dockerfile to the bitcoin-core folder
Create a .env file in the bitcoin folder - sudo touch .env
Modify the nginx.conf file from the bitcoin folder to specify the server domain or ip to bind.
Go to the bitcoin folder and run the following command: sudo docker-compose up -d

---------------------------------------------------------------------------------------------------------------------------------------------------------------------

to stop start: sudo docker-compose start/stop
to display all the active containers run: sudo docker-compose ps -a
to get logs of a specific container - run: sudo docker-compose logs -f [optional: --tail=1000] <container_id>
to run a specific container: sudo docker-compose up --no-deps --build <container_name>

Steps for Bitcoin/Bitcore manual setup can be found by simply analyzing the docker files (+ modifying of some configs
