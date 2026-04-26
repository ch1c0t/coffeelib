{ BuildMain } = require './build/main'
{ BuildRest } = require './build/rest'

{ mkdir } = IO.sync
exports.build = ->
  mkdir SRC
  mkdir LIB

  BuildMain()
  BuildRest()
