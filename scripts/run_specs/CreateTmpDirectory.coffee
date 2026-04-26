{ mkdir } = IO.sync
{ randomUUID } = require 'crypto'

exports.CreateTmpDirectory = ->
  name = "coffeelib.jasmine.#{process.pid}.#{randomUUID()}"
  path = "/tmp/#{name}"
  mkdir path
  path
