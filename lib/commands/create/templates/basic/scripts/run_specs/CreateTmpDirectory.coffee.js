`{ randomUUID } = require 'crypto'

exports.CreateTmpDirectory = ->
  name = "${project.name}.test.\#{process.pid}.\#{randomUUID()}"
  path = "/tmp/\#{name}"
  await IO.mkdir path
  path`;
