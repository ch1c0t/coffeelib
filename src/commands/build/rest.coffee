{ dirname } = require 'path'
{ compile } = require 'coffeescript'
{ read, write, mkdir } = IO.sync

BuildRest = ->
  files = glob.sync "#{SRC}/**/*.coffee", nodir: yes

  for file in files[1..] # without main.coffee
    BuildFile file

BuildFile = (file) ->
  source = read file
  output = compile source

  target = (file.replace SRC, LIB)[..-7] + 'js' # without .coffee
  mkdir dirname target
  write target, output

module.exports = { BuildRest, BuildFile }
