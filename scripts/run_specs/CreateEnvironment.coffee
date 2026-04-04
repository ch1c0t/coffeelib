require '@ch1c0t/io'

{ CreateJasmine } = require './CreateJasmine.coffee'
{ CreateTmpDirectory } = require './CreateTmpDirectory.coffee'
{ ResolvePathToCLI } = require './ResolvePathToCLI.coffee'

exports.CreateEnvironment = ->
  jasmine = CreateJasmine()
  tmp = await CreateTmpDirectory()
  cli = ResolvePathToCLI()

  { jasmine, tmp, cli }
