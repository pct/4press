root = exports ? @
should = require('chai').should()

command = require "#{__dirname}/../../src/lib/command"

describe 'lib/command.coffee', ->
  for name in ['help', 'deploy', 'server', 'update', 'post', 'page', 'new', ]
    it "should has a function named '#{name}'", ->
      command[name].should.be.a 'function'
