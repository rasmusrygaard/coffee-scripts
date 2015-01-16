var express = require('express');
var compression = require('compression');
var app = express();
var sourceDir = __dirname + '/dist';

app.get(['/script/:id', '/script/:id/play'], function(req, res) {
  res.sendFile(sourceDir + '/index.html');
})

app.use(compression({ threshold: 512 }));
app.use(express.static(sourceDir));
app.listen(process.env.PORT || 5000);
