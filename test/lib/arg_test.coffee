root = exports ? @
should = require('chai').should()

arg = require "#{__dirname}/../../src/lib/arg"

describe 'lib/arg.coffee', ->
  it 'should has a function named "parse"', ->
    arg.parse.should.be.a 'function'

  it 'should return object with {opt, req}', ->
    ret = arg.parse ['1, 2, 3, 4']
    ret.opt.should.be.a 'array'
    ret.req.should.be.a 'array'
