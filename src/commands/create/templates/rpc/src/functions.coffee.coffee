"""
{ VERSION, compile } = require 'coffeescript'

exports.functions =
  Version: -> VERSION
  Compile: f
    in:
      code: String
      bare: Boolean
    out: ->
      compile @code, @props
"""
