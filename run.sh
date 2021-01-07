#!/bin/bash

docker rm -f rinkeby-eth 

docker run -itd --restart=unless-stopped -v /etc/localtime:/etc/localtime -v /etc/timezone:/etc/timezone --name rinkeby-eth -v $(pwd)/rinkeby:/root/.ethereum/rinkeby -p 7001:8545 -p 7002:30303 ethereum/client-go:v1.9.24 --rinkeby --rpcapi db,eth,net,web3,personal,web3,txpool,admin,miner --etherbase=0x95b194fa00e6ec9a35b1b483f404b6ca89603380 --syncmode=fast --rpc --rpcaddr 0.0.0.0 --cache 2048 --maxpeers 30 --allow-insecure-unlock


docker logs -f rinkeby-eth --tail 10
