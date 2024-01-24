const fs = require('fs');

const data = fs.readFileSync(__dirname + '/resultData.json', { encoding: 'utf8', flag: 'r' });

try {
  const jsonData = JSON.parse(data);

  jsonData.forEach(item => {
    console.log(item.text);
  });
} catch (error) {
  console.error('Error parsing JSON:', error);
}
