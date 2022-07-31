"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const crypto_1 = __importDefault(require("crypto"));
class Block {
    constructor(prevHash, height, data, timestamp) {
        this.prevHash = prevHash;
        this.height = height;
        this.data = data;
        this.timestamp = timestamp;
        this.Hash = Block.calculateHash(prevHash, height, data);
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
    getTimestamp() {
        return new Date().getTime();
    }
    getPrevHash() {
        if (this.blocks.length === 0)
            return "";
        return this.blocks[this.blocks.length - 1].Hash;
    }
    addBlock(data) {
        const newblock = new Block(this.getPrevHash(), this.blocks.length + 1, data, this.getTimestamp());
        this.blocks.push(newblock);
    }
    getBlocks() {
        return [...this.blocks];
    }
}
const blockchain = new BlockChain();
