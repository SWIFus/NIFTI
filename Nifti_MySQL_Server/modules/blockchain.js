class Block {
    constructor(height, prev_Hash) {
        this.height = height;
        this.prev_Hash = prev_Hash;
        this.unChained_Hash = Block.getHash(height);
        this.Chained_Hash = Block.chainBlock(prev_Hash, this.unChained_Hash);
    }
    static getHash(height) {  // unChained_Hash를 만드는 함수
        let currentTime = Date.now();
        let data = height + currentTime;
        let primeNum = 1121741477;
        const NewArray = new Array;
        return (data * primeNum).toString(16);
    }
    static chainBlock(prev_Hash, unChained_Hash) {  // prev_Hash와 unChained_Hash를 이용하여 Chained_Hash를 만드는 함수
        let currentTime = Date.now();
        let Int_prev_Hash = parseInt(prev_Hash, 16);
        let Int_unChained_Hash = parseInt(unChained_Hash, 16);
        return (Int_prev_Hash + Int_unChained_Hash).toString(16);
    }
}
class BlockChain {
    constructor() {
        this.Blocks = [];
    }
    getPrevHash() {
        if (this.Blocks.length === 0)
            return "0";
        return this.Blocks[this.Blocks.length - 1].Chained_Hash;
    }
    addBlock() {  // 새로운 블록을 만드는 함수
        const newBlock = new Block(this.Blocks.length + 1, this.getPrevHash());
        this.Blocks.push(newBlock);
        return newBlock
    }
    getBlocks() {  // 현재 블록체인을 확인하는 함수
        return [...this.Blocks];
    }

    
    
    
}
export default BlockChain;