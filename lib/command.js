// Generated by CoffeeScript 1.3.3
var clc, util;

util = require('util');

clc = require('cli-color');

process.title = '4press';

module.exports = {
  help: function(args) {
    return require('./usage.js').help();
  },
  deploy: function(args) {
    return require('./deploy')(args);
  },
  server: function(args) {
    return require('./server.js');
  },
  update: function(args) {
    return require('./update.js')(args);
  },
  post: function(args) {
    return require('./post.js')(args);
  },
  page: function(args) {
    return require('./page.js')(args);
  },
  init: function(args) {
    return require('./init')(args);
  }
};