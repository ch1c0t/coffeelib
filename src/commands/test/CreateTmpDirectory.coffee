{ mkdir } = IO.sync
{ basename } = require 'path'
{ randomUUID } = require 'crypto'

exports.CreateTmpDirectory = ->
  name = "#{basename process.cwd()}.test.#{process.pid}.#{randomUUID()}"
  path = "/tmp/#{name}"
  mkdir path
  path
