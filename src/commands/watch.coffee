chokidar = require 'chokidar'

{ build } = require './build'
{ BuildFile } = require './build/rest'
{ BuildMain } = require './build/main'

exports.watch = ->
  await build()

  watcher = chokidar.watch "#{SRC}/**/*.coffee"
  watcher.on 'all', (event, path) ->
    if event in ['add', 'change']
      switch path
        when "#{SRC}/main.coffee"
          await BuildMain()
        else
          await BuildFile path
