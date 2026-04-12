`{ CreateJasmine } = require './CreateJasmine.coffee'
{ CreateTmpDirectory } = require './CreateTmpDirectory.coffee'
{ ResolvePathToCLI } = require './ResolvePathToCLI.coffee'

exports.CreateTestEnvironment = ->
  {
    jasmine: CreateJasmine()
    cli: ResolvePathToCLI()
    dir: await CreateTmpDirectory()
  }`;

