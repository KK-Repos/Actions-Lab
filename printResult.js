const fs = require("fs");

console.log(__dirname)

const data = fs.readFileSync('resultTest.js', { encoding: 'utf8', flag: 'r' });
const output = JSON.parse(data);
print("[output]",output)
