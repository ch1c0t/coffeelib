{ read, exists } = IO.sync
Jasmine = require 'jasmine'

default_config =
  spec_dir: 'spec'
  spec_files: [
    '**/*.spec.coffee'
  ]
  helpers: [
    'helpers/**/*.coffee'
  ]
  jsLoader: 'require'

exports.CreateJasmine = ->
  jasmine = new Jasmine()

  custom_config_path = 'spec/support/jasmine.json'
  if exists custom_config_path
    custom_config = JSON.parse read custom_config_path
    config = { default_config..., custom_config... }
  else
    config = default_config

  jasmine.loadConfig config
  jasmine.configureDefaultReporter
    showColors: true

  jasmine.exitOnCompletion = false
  jasmine
