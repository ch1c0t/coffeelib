"""
{ mkdir } = IO.sync
{ randomUUID } = require 'crypto'

exports.CreateTmpDirectory = ->
  name = "#{project.name}.test.\#{process.pid}.\#{randomUUID()}"
  path = "/tmp/\#{name}"
  mkdir path
  path
"""
