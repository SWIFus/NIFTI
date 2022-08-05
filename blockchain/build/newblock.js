"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
class NumBlock {
    constructor(prevNewHash, height, data) {
        this.prevNewHash = prevNewHash;
        this.height = height;
        this.data = data;
        this.NewHash = NumBlock.calculateNewHash(height, data);
    }
    static getHash(height, data) {
        return NumBlock.calculateNewHash(height, data);
    }
    static calculateNewHash(height, data) {
        let primeNum = 1121741477;
        const stringNewHash = `${height}${data}`;
        let stringToArray = stringNewHash.split("");
        const NewArray = new Array;
        for (let i = 0; i < stringToArray.length; i++) {
            NewArray[i] = stringToArray[i].codePointAt(0);
        }
        const NewString = NewArray.join("");
        const stringToInt = parseInt(NewString);
        return (stringToInt * primeNum).toString(16);
    }
}
class NewBlockChain {
    constructor() {
        this.blocks = [];
    }
    getPrevNewHash() {
        if (this.blocks.length === 0)
            return "";
        return this.blocks[this.blocks.length - 1].NewHash;
    }
    addBlock(data) {
        const newblock = new NumBlock(this.getPrevNewHash(), this.blocks.length + 1, data);
        this.blocks.push(newblock);
    }
    getBlocks() {
        return [...this.blocks];
    }
    isValidNewBlock(data) {
        const newblock = new NumBlock(this.getPrevNewHash(), this.blocks.length + 1, data);
        if (newblock.NewHash !== newblock.prevNewHash) {
            return { isError: true, error: '이전 해시값이 맞지 않습니다.' };
        }
        if (newblock.height !== this.blocks.length) {
            return { isError: true, error: '블록 높이가 맞지 않습니다.' };
        }
        if (NumBlock.getHash(this.blocks.length, data) !== newblock.NewHash) {
            return { isError: true, error: '해시값이 맞지 않습니다.' };
        }
    }
}
const blockchain = new NewBlockChain();
blockchain.addBlock("First");
blockchain.addBlock("Second");
blockchain.addBlock("Third");
console.log(blockchain.getBlocks());
