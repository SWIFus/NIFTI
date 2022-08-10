

import crypto from "crypto";

interface NumBlockShape {
    NewHash: string;
    data: string;
    height: number;
    prevHash: string;
    addedHash: string;
}



   

class NumBlock implements NumBlockShape {
    public NewHash: string;
    public addedHash: string;
    constructor(
        public prevHash: string,
        public height: number,
        public data: string,
        
    ) {
        this.NewHash = NumBlock.calculateNewHash(height, data);
        this.addedHash = NumBlock.calculateAddedHash(prevHash, height, data);
    } 
    
    public static getHash(height: number, data: string) {
        return NumBlock.calculateNewHash(height, data);
    }

    static calculateNewHash(height: number, data:string) {
        let primeNum = 1121741477;
        let stringToArray = data.split("");
        var num: number = height;
        const NewArray = new Array;

        for (let i = 0; i < stringToArray.length; i++) {
            NewArray[i] = stringToArray[i].codePointAt(0);  
        }

        for (let j = 0; j < stringToArray.length; j++) {
            num += NewArray[j];
        }
        const returnNum = (num * primeNum);

        return returnNum;
    }
    static calculateAddedHash(prevHash: string, height: number, data:string) {
        let primeNum = 1121741477;
        let stringToArray = data.split("");
        let prevHashToInt = parseInt(prevHash);
        var num: number = height;
        const NewArray = new Array;
        

        for (let i = 0; i < stringToArray.length; i++) {
            NewArray[i] = stringToArray[i].codePointAt(0);
        }
        for (let i = 0; i < stringToArray.length; i++) {
            num += NewArray[i];
        }

  
        let returnNum = (num * primeNum + prevHashToInt);

        return returnNum);
    }
}

class NewBlockChain {
    private blocks: NumBlock[];
    constructor() {
        this.blocks = [];
    }
    private getPrevHash() {
        if (this.blocks.length === 0) return ""
        return this.blocks[this.blocks.length - 1].NewHash;
    }
    public addBlock(data:string){
        const newblock = new NumBlock(this.getPrevHash(), this.blocks.length + 1, data);
        this.blocks.push(newblock);
    }
    public getBlocks() {
        return [...this.blocks];
    }
    public isValidNewBlock(data:string) {  // 유효성 확인
        const newblock = new NumBlock(this.getPrevHash(), this.blocks.length + 1, data);

        if (newblock.NewHash !== newblock.prevHash) {
            return { isError: true, error: '이전 해시값이 맞지 않습니다.' };
        }

        if (newblock.height !== this.blocks.length) {
            return { isError: true, error: '블록 높이가 맞지 않습니다.' };
        }

        if (NumBlock.getHash(this.blocks.length, data) !== newblock.NewHash) {
            return  { isError: true, error: '해시값이 맞지 않습니다.'};
        }
    }
}
const generateRandomString = (num: number) => {
    const characters ='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
    let result = '';
    const charactersLength = characters.length;
    for (let i = 0; i < num; i++) {
        result += characters.charAt(Math.floor(Math.random() * charactersLength));
    }
  
    return result;
  }



const blockchain = new NewBlockChain();
for (let i = 0; i < 100; i++) {
    var stringArray = generateRandomString(10);
    blockchain.addBlock(stringArray);
    blockchain.isValidNewBlock(stringArray);
}
console.log(blockchain.getBlocks());


