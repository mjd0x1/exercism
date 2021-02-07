"use strict";

var _bob = require("./bob");

describe('Bob', function () {
  test('stating something', function () {
    var result = (0, _bob.hey)('Tom-ay-to, tom-aaaah-to.');
    expect(result).toEqual('Whatever.');
  });
  test('shouting', function () {
    var result = (0, _bob.hey)('WATCH OUT!');
    expect(result).toEqual('Whoa, chill out!');
  });
  test('shouting gibberish', function () {
    var result = (0, _bob.hey)('FCECDFCAAB');
    expect(result).toEqual('Whoa, chill out!');
  });
  test('asking a question', function () {
    var result = (0, _bob.hey)('Does this cryogenic chamber make me look fat?');
    expect(result).toEqual('Sure.');
  });
  test('asking a numeric question', function () {
    var result = (0, _bob.hey)('You are, what, like 15?');
    expect(result).toEqual('Sure.');
  });
  test('asking gibberish', function () {
    var result = (0, _bob.hey)('fffbbcbeab?');
    expect(result).toEqual('Sure.');
  });
  test('talking forcefully', function () {
    var result = (0, _bob.hey)("Let's go make out behind the gym!");
    expect(result).toEqual('Whatever.');
  });
  test('using acronyms in regular speech', function () {
    var result = (0, _bob.hey)("It's OK if you don't want to go to the DMV.");
    expect(result).toEqual('Whatever.');
  });
  test('forceful question', function () {
    var result = (0, _bob.hey)('WHAT THE HELL WERE YOU THINKING?');
    expect(result).toEqual("Calm down, I know what I'm doing!");
  });
  test('shouting numbers', function () {
    var result = (0, _bob.hey)('1, 2, 3 GO!');
    expect(result).toEqual('Whoa, chill out!');
  });
  test('no letters', function () {
    var result = (0, _bob.hey)('1, 2, 3');
    expect(result).toEqual('Whatever.');
  });
  test('question with no letters', function () {
    var result = (0, _bob.hey)('4?');
    expect(result).toEqual('Sure.');
  });
  test('shouting with special characters', function () {
    var result = (0, _bob.hey)('ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!');
    expect(result).toEqual('Whoa, chill out!');
  });
  test('shouting with no exclamation mark', function () {
    var result = (0, _bob.hey)('I HATE YOU');
    expect(result).toEqual('Whoa, chill out!');
  });
  test('statement containing question mark', function () {
    var result = (0, _bob.hey)('Ending with a ? means a question.');
    expect(result).toEqual('Whatever.');
  });
  test('non-letters with question', function () {
    var result = (0, _bob.hey)(':) ?');
    expect(result).toEqual('Sure.');
  });
  test('prattling on', function () {
    var result = (0, _bob.hey)('Wait! Hang on. Are you going to be OK?');
    expect(result).toEqual('Sure.');
  });
  test('silence', function () {
    var result = (0, _bob.hey)('');
    expect(result).toEqual('Fine. Be that way!');
  });
  test('prolonged silence', function () {
    var result = (0, _bob.hey)('          ');
    expect(result).toEqual('Fine. Be that way!');
  });
  test('alternate silence', function () {
    var result = (0, _bob.hey)('\t\t\t\t\t\t\t\t\t\t');
    expect(result).toEqual('Fine. Be that way!');
  });
  test('multiple line question', function () {
    var result = (0, _bob.hey)('\nDoes this cryogenic chamber make me look fat?\nno');
    expect(result).toEqual('Whatever.');
  });
  test('starting with whitespace', function () {
    var result = (0, _bob.hey)('         hmmmmmmm...');
    expect(result).toEqual('Whatever.');
  });
  test('ending with whitespace', function () {
    var result = (0, _bob.hey)('Okay if like my  spacebar  quite a bit?   ');
    expect(result).toEqual('Sure.');
  });
  test('other whitespace', function () {
    var result = (0, _bob.hey)('\n\r \t');
    expect(result).toEqual('Fine. Be that way!');
  });
  test('non-question ending with whitespace', function () {
    var result = (0, _bob.hey)('This is a statement ending with whitespace      ');
    expect(result).toEqual('Whatever.');
  });
});