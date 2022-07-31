"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const crypto_1 = __importDefault(require("crypto"));
class Block {
    constructor(prevHash, height, data) {
        this.prevHash = prevHash;
        this.height = height;
        this.data = data;
        this.Hash = Block.calculateHash(prevHash, height, data);
    }
    static getHash(prevHash, height, data) {
        return Block.calculateHash(prevHash, height, data);
    }
    static calculateHash(prevHash, height, data) {
        const toHash = `${prevHash}${height}${data}`;
        return crypto_1.default.createHash("sha256").update(toHash).digest("hex");
    }
}
class BlockChain {
    constructor() {
        this.blocks = [];
    }
    getPrevHash() {
        if (this.blocks.length === 0)
            return "";
        return this.blocks[this.blocks.length - 1].Hash;
    }
    addBlock(data) {
        const newblock = new Block(this.getPrevHash(), this.blocks.length + 1, data);
        this.blocks.push(newblock);
    }
    getBlocks() {
        return [...this.blocks];
    }
    isValidNewBlock(data) { // 유효성 검사
        const newblock = new Block(this.getPrevHash(), this.blocks.length + 1, data);
        if (newblock.Hash !== newblock.prevHash) {
            return { isError: true, error: '이전 해시값이 맞지 않습니다.' };
        }
        if (newblock.height !== this.blocks.length) {
            return { isError: true, error: '블록 높이가 맞지 않습니다.' };
        }
        if (Block.getHash(this.getPrevHash(), this.blocks.length, data) !== newblock.Hash) {
            return { isError: true, error: '해시값이 맞지 않습니다.' };
        }
    }
}
const blockchain = new BlockChain();
blockchain.addBlock("First");
blockchain.addBlock("Second");
blockchain.addBlock("Third");
console.log(blockchain.getBlocks());
