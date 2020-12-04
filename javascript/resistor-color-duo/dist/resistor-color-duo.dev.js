"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.decodedValue = void 0;

var decodedValue = function decodedValue(resistors) {
  var colors = {
    "black": 0,
    "brown": 1,
    "red": 2,
    "orange": 3,
    "yellow": 4,
    "green": 5,
    "blue": 6,
    "violet": 7,
    "grey": 8,
    "white": 9
  };
  return parseInt(resistors.map(function (x) {
    return colors[x].toString();
  }).join(''));
};

exports.decodedValue = decodedValue;