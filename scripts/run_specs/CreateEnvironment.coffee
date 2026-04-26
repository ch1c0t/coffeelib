{ CreateJasmine } = require './CreateJasmine.coffee'
{ CreateTmpDirectory } = require './CreateTmpDirectory.coffee'
{ ResolvePathToCLI } = require './ResolvePathToCLI.coffee'

exports.CreateEnvironment = ->
  await Promise.resolve()

  jasmine = CreateJasmine()
  tmp = CreateTmpDirectory()
  cli = ResolvePathToCLI()

  { jasmine, tmp, cli }
