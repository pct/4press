util = require('util')
clc  = require('cli-color')

process.title = '4press'

# commands
module.exports =
	help: (args) ->
		require('./usage.js').help()
	deploy: (args) ->
		require('./deploy')(args)
		#util.puts('This methods was not implemented')
	server: (args) ->
		require('./server.js')
	build: (args) ->
		require('./build.js')(args)
	post: (args) ->
		require('./post.js')(args)
	page: (args) ->
		require('./page.js')(args)
	new: (args) ->
		require('./new')(args)
		#util.puts('This methods was not implemented')
