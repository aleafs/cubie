
"use strict"

require('http').createServer(function (req, res) {
  res.end(req.url);
}).listen(7001);
