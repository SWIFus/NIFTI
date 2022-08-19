import BlockChain from "../blockchain/build/block.js";


const blockchain = new BlockChain();
for (let i = 0; i<10; i++){
    blockchain.addBlock();
}
console.log(blockchain.getBlocks());