{spawn, exec} = require 'child_process'

try
  which = require('which').sync
catch err
  if process.platform.match(/^win/)?
    console.log 'WARNING: the which module is required for windows\ntry: npm install which'
  which = null

# ANSI Terminal Colors
bold = '\x1b[0;1m'
green = '\x1b[0;32m'
reset = '\x1b[0m'
red = '\x1b[0;31m'

task 'build', 'compile source', -> build -> log "build lib done!", green
task 'watch', 'compile and watch', -> build true, -> log "build and watch :-)", green
task 'clean', 'clean generated files', -> clean -> log "clean ./bin and ./lib done!", green

log = (message, color, explanation) -> console.log color + message + reset + ' ' + (explanation or '')

launch = (cmd, options=[], callback) ->
  cmd = which(cmd) if which
  app = spawn cmd, options
  app.stdout.pipe(process.stdout)
  app.stderr.pipe(process.stderr)
  app.on 'exit', (status) -> callback?() if status is 0

#
# build 4press command
#
build_bin = (watch, callback) ->
  if typeof watch is 'function'
    callback = watch
    watch = off

  cmd = "coffee -o bin -c -b src/4press.coffee; echo '#!/usr/bin/env node' > bin/4press; cat bin/4press.js >> bin/4press; chmod +x bin/4press; rm -f bin/4press.js"
  exec cmd, ->
    log 'build bin/4press done!', green
    callback

#
# build
#
build = (watch, callback) ->
  if typeof watch is 'function'
    callback = watch
    watch = off

  build_bin()

  # build lib
  options = ['-o', 'lib', '-c', '-b', 'src/lib']
  options.unshift '-w' if watch
  launch 'coffee', options, callback

#
# clean
#
clean = (callback) ->
  cmd = 'rm -f bin/4press; rm -rf lib/*'
  exec cmd, callback

