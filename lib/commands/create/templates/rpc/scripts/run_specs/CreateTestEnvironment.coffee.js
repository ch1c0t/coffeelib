`{ CreateJasmine } = require './CreateJasmine.coffee'
{ CreateTmpDirectory } = require './CreateTmpDirectory.coffee'
{ ResolvePathToCLI } = require './ResolvePathToCLI.coffee'

exports.CreateTestEnvironment = ->
  await Promise.resolve()

  {
    jasmine: CreateJasmine()
    cli: ResolvePathToCLI()
    dir: CreateTmpDirectory()
  }`;

