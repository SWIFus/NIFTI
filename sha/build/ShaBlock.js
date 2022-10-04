var crypto = require('crypto');
const { SHA256 } = require('crypto-js');

class Block {
    constructor(height, data, prevHash) {
        this.height = height;
        this.data = data;
        this.prevHash = prevHash;
        this.Chained_hash = Block.calculateHash(height, data, prevHash);
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
        return this.blocks[this.blocks.length - 1].Chained_hash;
    }
    addBlock(data) {  // 해쉬화 한 닉네임을 데이터에 넣어서 블록 추가
        const newBlock = new Block(this.blocks.length + 1, data, this.getPrevHash());
        this.blocks.push(newBlock);
    }
    getBlocks() {  // 현재 블록들 리턴
        return [...this.blocks];
    }
    getData(data) {  // uuid 데이터와 현재 시간을 합쳐 해쉬화 
        const t_data = `${this.getTime()}${data}`
        return crypto.createHash('sha256').update(t_data).digest('hex');
    }

    getTime() {  // 데이터 받은 시점에 사용할 타임스탬프 함수
        const time = Date.now()
        return time
    }
    
    getHashofHash(hash_data) {  // 사용자에 지급할 해쉬의 해쉬를 생성하는 함수
        return crypto.createHash('sha256').update(hash_data).digest('hex')
    }
}

exports.Blockchain = Blockchain; 