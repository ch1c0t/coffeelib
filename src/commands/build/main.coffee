{ compile } = require 'coffeescript'

BuildMain = ->
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
  names = []

  ast = compile source, ast: yes
  nodes = ast.program.body

  for node in nodes
    if node?.expression?.type is 'AssignmentExpression'
      { left, right } = node.expression
      if (left?.type is 'MemberExpression') and (left?.object?.type is 'Identifier')
        { object, property } = left
        switch object.name
          when 'module'
            if right.type is 'ObjectExpression'
              names = right.properties.map (property) ->
                property.key.name
          when 'exports'
            names.push left.property.name

  names

module.exports = { BuildMain, FindNames }
