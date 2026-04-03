require '@ch1c0t/ext'
{ CreateJasmine } = require './run_specs/CreateJasmine.coffee'

jasmine = CreateJasmine()
jasmine.execute()
  .then (info) ->
    p info
    if info.overallStatus is 'failed'
      process.exit 3
