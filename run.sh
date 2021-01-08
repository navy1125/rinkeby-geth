#!/bin/bash

#docker pull ethereum/client-go:v1.9.24

#sudo docker exec -it 30c85856a675  /bin/sh
#sudo docker attach 76e980019fe8
#geth --datadir=rinkeby attach ipc:rinkeby/geth.ipc console
docker rm -f rinkeby-eth 

docker run -itd --restart=unless-stopped -v /etc/localtime:/etc/localtime -v /etc/timezone:/etc/timezone --name rinkeby-eth -v $(pwd)/rinkeby:/root/.ethereum/rinkeby -p 7001:8545 -p 7002:30303 ethereum/client-go:v1.9.24 --rinkeby --rpcapi eth,net,web3,personal,web3,txpool,admin,miner --miner.etherbase=0x95b194fa00e6ec9a35b1b483f404b6ca89603380 --syncmode=fast --rpc --rpcaddr 0.0.0.0 --cache 2048 --maxpeers 30 --allow-insecure-unlock --mine --miner.threads=4


docker logs -f rinkeby-eth --tail 10
