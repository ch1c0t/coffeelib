require '@ch1c0t/ext'

{ CreateEnvironment } = require './run_specs/CreateEnvironment.coffee'

run = ->
  global.ENV = await CreateEnvironment()
  p "Created #{ENV.tmp}"

  ENV.jasmine.execute()
    .then (info) ->
      p info
      if info.overallStatus is 'failed'
        process.exit 3

run()
