

import crypto from "crypto";

interface BlockShape {
    Hash:  string;
    prevHash: string;
    data: string;
    height: number;
}


class Block implements BlockShape {
    public Hash: string;
    constructor(
        public prevHash: string,
        public height: number,
        public data: string
    ) {
        this.Hash = Block.calculateHash(prevHash, height, data);
    } 
    
    public static getHash(prevHash: string, height: number, data: string) {
        return Block.calculateHash(prevHash, height, data);
    }

    static calculateHash(prevHash: string, height: number, data: string) {
        const toHash = `${prevHash}${height}${data}`;
        return crypto.createHash("sha256").update(toHash).digest("hex");
        
    }

}

class BlockChain {
    private blocks: Block[];
    constructor() {
        this.blocks = [];
    }
    private getPrevHash() {
        if (this.blocks.length === 0) return ""
        return this.blocks[this.blocks.length - 1].Hash;
    }
    public addBlock(data:string){
        const newblock = new Block(this.getPrevHash(), this.blocks.length + 1, data);
        this.blocks.push(newblock);
    }
    public getBlocks() {
        return [...this.blocks];
    }
    public isValidNewBlock(data:string) {  // 유효성 확인
        const newblock = new Block(this.getPrevHash(), this.blocks.length + 1, data);

        if (newblock.Hash !== newblock.prevHash) {
            return { isError: true, error: '이전 해시값이 맞지 않습니다.' };
        }

        if (newblock.height !== this.blocks.length) {
            return { isError: true, error: '블록 높이가 맞지 않습니다.' };
        }

        if (Block.getHash(this.getPrevHash(), this.blocks.length, data) !== newblock.Hash) {
            return  { isError: true, error: '해시값이 맞지 않습니다.'};
        }
    }
}



const blockchain = new BlockChain();
blockchain.addBlock("First");
blockchain.addBlock("Second");
blockchain.addBlock("Third");
console.log(blockchain.getBlocks());


