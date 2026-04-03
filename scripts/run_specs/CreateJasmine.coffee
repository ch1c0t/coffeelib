Jasmine = require 'jasmine'

exports.CreateJasmine = ->
  jasmine = new Jasmine()
  jasmine.loadConfigFile 'spec/support/jasmine.json'
  jasmine.configureDefaultReporter
    showColors: true

  jasmine.exitOnCompletion = false
  jasmine
