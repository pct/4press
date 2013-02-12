#!/usr/bin/env node
args = process.argv.slice(2)
command_name = args.shift()
commands = require("../lib/command")
switch command_name
  when "-v", "--version", "ver", "version"
    version = require("../package.json").version
    console.log version
  else
    command = commands[command_name] or commands.help
    command args
