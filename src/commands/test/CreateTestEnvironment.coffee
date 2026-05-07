{ CreateJasmine } = require './CreateJasmine'
{ CreateTmpDirectory } = require './CreateTmpDirectory'
{ ResolvePathToCLI } = require './ResolvePathToCLI'
{ StartTasks } = require './StartTasks'

exports.CreateTestEnvironment = ->
  dir = CreateTmpDirectory()

  {
    dir
    jasmine: CreateJasmine()
    cli: ResolvePathToCLI()
    tasks: await StartTasks inside_of: dir
  }
