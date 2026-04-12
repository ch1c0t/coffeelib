"""
{ CreateJasmine } = require './CreateJasmine.coffee'
{ CreateTmpDirectory } = require './CreateTmpDirectory.coffee'
{ ResolvePathToCLI } = require './ResolvePathToCLI.coffee'

exports.CreateTestEnvironment = ->
  jasmine = CreateJasmine()
  dir = await CreateTmpDirectory()
  cli = ResolvePathToCLI()

  { jasmine, dir, cli }
"""
