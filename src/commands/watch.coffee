chokidar = require 'chokidar'

{ build } = require './build'
{ BuildFile } = require './build/rest'
{ BuildMain } = require './build/main'

exports.watch = ->
  build()

  watcher = chokidar.watch SRC
  watcher.on 'all', (event, path) ->
    console.log event, path
    if event in ['add', 'change']
      switch path
        when "#{SRC}/main.coffee"
          BuildMain()
        else
          BuildFile path
