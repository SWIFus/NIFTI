

import crypto from "crypto";

interface BlockShape {
    Chained_Hash: string;
    unChained_Hash: string;
    height: number;
    prev_Hash: string;
}

class Block implements BlockShape {
    public unChained_Hash: string;
    public Chained_Hash: string;
    constructor (
        public height: number,
        public prev_Hash: string,
    ) {
        this.unChained_Hash = Block.getHash(height);
        this.Chained_Hash = Block.chainBlock(prev_Hash, this.unChained_Hash);

        
    }

    

    static getHash(height: number) {
        let currentTime = Date.now();
        let data = height + currentTime;
        let primeNum = 1121741477;
        const NewArray = new Array;

        return (data * primeNum).toString(16);

    }

    static chainBlock(prev_Hash: string, unChained_Hash: string) {
        let currentTime = Date.now();
        let Int_prev_Hash = parseInt(prev_Hash, 16);
        let Int_unChained_Hash = parseInt(unChained_Hash, 16);

        return (Int_prev_Hash + Int_unChained_Hash).toString(16);
    }
    

}

class BlockChain {
    private Blocks: Block[]
    constructor() {
        this.Blocks = [];
    }

    public getPrevHash() {
        if (this.Blocks.length === 0) return "0"
        return this.Blocks[this.Blocks.length - 1].Chained_Hash;
    }

    public addBlock() {
        const newBlock = new Block(this.Blocks.length + 1, this.getPrevHash());

        this.Blocks.push(newBlock);
    }

    public getBlocks() {
        return [...this.Blocks];
    }

    

    public isValidNewblock() {
        if (this.Blocks.length !== this.Blocks.length) {
            console.log("*** Invalid index ***");
            return false;
        } else if (this.getPrevHash() !== this.getPrevHash()) {
            console.log("*** Invalid BlockStructure ***") 
            return false;
            }
        }

    

}


const blockchain = new BlockChain();






    





