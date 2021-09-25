coffee = require 'coffeescript'
glob = require 'glob'

{ dirname } = require 'path'

BuildRest = ->
  files = glob.sync "#{SRC}/**/*.coffee", nodir: yes

  for file in files[1..] # without main.coffee
    await BuildFile file

BuildFile = (file) ->
  source = await IO.read file
  output = coffee.compile source

  target = (file.replace SRC, LIB)[..-7] + 'js' # without .coffee
  await IO.ensure dirname target
  await IO.write target, output

module.exports = { BuildRest, BuildFile }
