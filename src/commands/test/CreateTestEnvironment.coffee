{ CreateJasmine } = require './CreateJasmine'
{ CreateTmpDirectory } = require './CreateTmpDirectory'
{ ResolvePathToCLI } = require './ResolvePathToCLI'

exports.CreateTestEnvironment = ->
  await Promise.resolve()

  {
    dir: CreateTmpDirectory()
    jasmine: CreateJasmine()
    cli: ResolvePathToCLI()
    tasks: []
  }
