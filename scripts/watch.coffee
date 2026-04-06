require './compile'

chokidar = require 'chokidar'
{ CompileFile } = require './compile/CompileFile'

watcher = chokidar.watch SRC
watcher.on 'all', (event, path) ->
  console.log event, path
  if event in ['add', 'change']
    CompileFile path
