
"use strict"

var fs = require('fs');
require('http').createServer(function (req, res) {
  res.end(req.url);
}).listen(7001);
