chokidar = require 'chokidar'

exports.watch = ->
  watcher = chokidar.watch "#{SRC}/**/*.coffee"
  watcher.on 'all', (event, path) ->
    console.log event, path
    if event in ['add', 'change']
      switch path
        when "#{SRC}/main.coffee"
          console.log path
        else
          console.log path
