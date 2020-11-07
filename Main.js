"use strict";

let main = require('../../main.js')

exports.addInt = function(x, y) {
  return main._add_int(x, y);
};

exports.version = main.ccall("version", 'string', []);
