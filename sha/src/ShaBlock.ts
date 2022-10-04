import * as CryptoJS from "crypto-js";

interface BlockShape {
    hash: string;
    height: number;
    data: string;
    prevHash: string;
}

class Block implements BlockShape {
    public hash: string;
    constructor(
        public height: number,
        public data: string,
        public prevHash: string
    ) {
        this.hash = Block.calculateHash(height,data,prevHash);
    }

    static calculateHash(height:number, data:string, prevHash:string) { // 16진수끼리 더함
        const toHash = `${height}${data}${prevHash}`;
        return CryptoJS.SHA256(toHash).toString();
    }

}

class Blockchain {
    private blocks: Block[];
    constructor() {
        this.blocks = [];
    }
    private getPrevHash(){
        if(this.blocks.length === 0) return ""
        return this.blocks[this.blocks.length - 1].hash;
    }

    public addBlock(data:string){ // 
        const newBlock = new Block(this.blocks.length + 1, data, this.getPrevHash());
        this.blocks.push(newBlock)
    }

    public getBlocks() { 
        return [...this.blocks]
    }


    public getData(data:string) { 
        return CryptoJS.SHA256(data).toString()
    }

    
}

