coffee = require 'coffeescript'
glob = require 'glob'

exports.BuildRest = ->
  files = glob.sync "#{SRC}/**/*.coffee",
    nodir: yes
    ignore: '/main.coffee'

  dirs = glob.sync "#{SRC}/**/"
  for dir in dirs
    dir = dir.replace SRC, LIB
    IO.ensure dir

  for file in files
    source = await IO.read file
    output = coffee.compile source
    file = file.replace SRC, LIB
    await IO.write file, output
