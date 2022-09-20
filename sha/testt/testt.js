import { Blockchain } from "../build/ShaBlock.js";

const blockchain = new Blockchain();


console.log(blockchain.getData("김태우"));
console.log(blockchain.getData("이보민"));
console.log(blockchain.getData("배강민"));
console.log(blockchain.getData("진윤겸"));



blockchain.addBlock("b346520e892ad5fa1e583e5f2d2052aa53799172269d9edeea5cb3941581ddc5");
blockchain.addBlock("bad32046d8a3951303ff01902905ff7a3ec13c4904ace87ef3a9c8140092f06a");
blockchain.addBlock("2b4efeaacbd23be65ca8ebeb62c8f0b2d139c97643b82ef41893f9fe6b4fe42f");
blockchain.addBlock("4a36d12061e7ecf406ca8e830a30c79bd6a0365d43b3247c745af889898584f7");

console.log(blockchain.getBlocks());