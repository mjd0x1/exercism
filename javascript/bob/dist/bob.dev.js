"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.hey = void 0;

function _toConsumableArray(arr) { return _arrayWithoutHoles(arr) || _iterableToArray(arr) || _nonIterableSpread(); }

function _nonIterableSpread() { throw new TypeError("Invalid attempt to spread non-iterable instance"); }

function _iterableToArray(iter) { if (Symbol.iterator in Object(iter) || Object.prototype.toString.call(iter) === "[object Arguments]") return Array.from(iter); }

function _arrayWithoutHoles(arr) { if (Array.isArray(arr)) { for (var i = 0, arr2 = new Array(arr.length); i < arr.length; i++) { arr2[i] = arr[i]; } return arr2; } }

var hey = function hey(message) {
  var isQuestion = function isQuestion(x) {
    return x.trim()[x.trim().length - 1] == '?';
  };

  var hasLetter = function hasLetter(x) {
    return _toConsumableArray(x).map(function (x) {
      return new Set("ABCDEFGHIJKLMNOPQRSTUVWXYZ").has(x);
    }).some(function (x) {
      return x == true;
    });
  };

  var isShout = function isShout(x) {
    return x.toUpperCase() == x && hasLetter(x);
  };

  var isSilence = function isSilence(x) {
    return x.trim() == "";
  };

  if (isSilence(message)) return 'Fine. Be that way!';
  if (isShout(message) && isQuestion(message)) return "Calm down, I know what I'm doing!";
  if (isShout(message)) return 'Whoa, chill out!';
  if (isQuestion(message)) return 'Sure.';
  return 'Whatever.';
};

exports.hey = hey;