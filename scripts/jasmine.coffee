require '@ch1c0t/ext'
Jasmine = require 'jasmine'

jasmine = new Jasmine()
jasmine.loadConfigFile 'spec/support/jasmine.json'
jasmine.configureDefaultReporter
  showColors: true

jasmine.exitOnCompletion = false

jasmine.execute()
  .then (info) ->
    p info
    if info.overallStatus is 'failed'
      process.exit 3
