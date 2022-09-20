var crypto = require('crypto');

class Block {
    constructor(height, data, prevHash) {
        this.height = height;
        this.data = data;
        this.prevHash = prevHash;
        this.hash = Block.calculateHash(height, data, prevHash);
    }
    static calculateHash(height, data, prevHash) {
        const toHash = `${height}${data}${prevHash}`;
        return crypto.createHash('sha256').update(toHash).digest('hex');
    }
}
class Blockchain {
    constructor() {
        this.blocks = [];
    }
    getPrevHash() {
        if (this.blocks.length === 0)
            return "";
        return this.blocks[this.blocks.length - 1].hash;
    }
    addBlock(data) {  // 해쉬화 한 닉네임을 데이터에 넣어서 블록 추가
        const newBlock = new Block(this.blocks.length + 1, data, this.getPrevHash());
        this.blocks.push(newBlock);
    }
    getBlocks() {  // 현재 블록들 리턴
        return [...this.blocks];
    }
    getData(data) {  // 닉네임 입력한걸 해쉬화 
        return crypto.createHash('sha256').update(data).digest('hex');
    }
}

exports.Blockchain = Blockchain;