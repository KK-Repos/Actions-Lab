const express = require('express');

const app = express();

app.get('/add', function(req, res) {
  const firstNumber = Number(req.query.firstNumber);
  const secondNumber = Number(req.query.secondNumber);

  const sum = firstNumber + secondNumber;

 console.log("[Result]",sum)

  res.send({
    sum:sum
  });

});

app.listen(3000);
console.log('Server started on port 3000');
