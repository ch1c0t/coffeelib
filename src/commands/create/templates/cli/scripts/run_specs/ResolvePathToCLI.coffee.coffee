"""
path = require 'path'

exports.ResolvePathToCLI = ->
  spec = require '../../package.json'
  { name } = spec

  path.resolve 'bin', name
"""
