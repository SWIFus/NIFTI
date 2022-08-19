const a = "Hello World";
let encoded = "01"
let index = 0;


[...a].forEach(element => {
    console.log(a.charCodeAt(index));
    encoded += a.charCodeAt(index).toString(16);
    index += 1;
});
console.log(encoded)