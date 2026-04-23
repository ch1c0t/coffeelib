"""
require '@ch1c0t/ext'
{ compile, VERSION } = require 'coffeescript'

exports.functions =
  Version: -> VERSION
  Compile: (input) ->
    { code, bare } = input

    if code.isString()
      compile code,
        bare: !!bare
    else
      error: "Expected input.code to be a valid CoffeeScript code."
"""
