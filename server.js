const express = require('express');

// # test
const app = express();

const port = process.env.PORT || 8080
app.get('/add', function(req, res) {
  const firstNumber = Number(req.query.firstNumber);
  const secondNumber = Number(req.query.secondNumber);

  const sum = firstNumber + secondNumber;

 console.log("[Result]",sum)

  res.send({
    sum:sum
  });

});

app.listen(port);
console.log(`Server started on port ${port}`);
