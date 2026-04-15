require './compile'

chokidar = require 'chokidar'
{ CompileFile } = require './compile/CompileFile'
{ RemoveFile } = require './watch/RemoveFile'

watcher = chokidar.watch SRC
watcher.on 'all', (event, path) ->
  console.log event, path
  if event in ['add', 'change']
    CompileFile path
  if event is 'unlink'
    RemoveFile path
