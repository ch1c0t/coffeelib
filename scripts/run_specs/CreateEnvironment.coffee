require '@ch1c0t/io'

{ randomUUID } = require 'crypto'
{ CreateJasmine } = require './CreateJasmine.coffee'

CreateTmpDirectory = ->
  name = "coffeelib.jasmine.#{process.pid}.#{randomUUID()}"
  path = "/tmp/#{name}"
  await IO.mkdir path
  path

exports.CreateEnvironment = ->
  jasmine = CreateJasmine()
  tmp = await CreateTmpDirectory()

  { tmp, jasmine }
