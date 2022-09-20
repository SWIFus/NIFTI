import BlockChain from "../blockchain/build/block.js";


const blockchain = new BlockChain();
for (let i = 0; i<100; i++){
    blockchain.addBlock();
}
console.log(blockchain.getBlocks());