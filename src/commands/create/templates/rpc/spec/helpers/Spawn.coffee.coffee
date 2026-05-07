"""
{ spawn } = require 'child_process'

global.Spawn = (path, { args = [], env = process.env }) ->
  cli = spawn path, args, { env }
  TE.tasks.push cli

  AtExit ->
    try
      process.kill cli.pid
    catch error
      unless error.code is 'ESRCH'
        console.error error

  cli
"""
