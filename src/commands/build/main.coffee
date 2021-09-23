{ compile } = require 'coffeescript'

exports.BuildMain = ->
  source = await IO.read "#{SRC}/main.coffee"
  output = compile source
  IO.write "#{LIB}/main.js", output
  await BuildESM source

BuildESM = (source) ->
  names = FindNames source
  lines = names.map (name) ->
    "export const #{name} = m.#{name}"

  await IO.write "#{LIB}/esm.mjs", [
    "import m from './main.js'"
    lines...
  ].join "\n"

FindNames = (source) ->
  source
    .split "\n"
    .filter (line) ->
      line.startsWith 'exports.'
    .map (line) ->
      line.split(' ')[0].split('.')[1]
