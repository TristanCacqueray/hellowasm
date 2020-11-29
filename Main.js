"use strict";

let loader = require("../../loader.js");

exports.withWasm = (wasmURL, callback) => () => {
  loader.load(wasmURL, callback)
};

exports.addInt = function (module, x, y) {
  return module._add_int(x, y);
};

exports.version = function (module) {
  return module.ccall("version", 'string', []);
}
