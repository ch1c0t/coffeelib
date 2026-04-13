`{ CreateJasmine } = require './CreateJasmine.coffee'
{ CreateTmpDirectory } = require './CreateTmpDirectory.coffee'

exports.CreateTestEnvironment = ->
  {
    jasmine: CreateJasmine()
    dir: await CreateTmpDirectory()
  }`;

