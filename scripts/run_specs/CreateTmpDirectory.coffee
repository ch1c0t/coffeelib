{ randomUUID } = require 'crypto'

exports.CreateTmpDirectory = ->
  name = "coffeelib.jasmine.#{process.pid}.#{randomUUID()}"
  path = "/tmp/#{name}"
  await IO.mkdir path
  path
