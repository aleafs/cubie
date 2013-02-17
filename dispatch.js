
"use strict"

var fs = require('fs');
require('http').createServer(function (req, res) {
  fs.readFile('/proc/loadavg', function (e, data) {
    res.end(JSON.stringify({
      'url' : req.url,
      'loadavg' : String(data),
    }));
  });
}).listen(7001);
