{ BuildMain } = require './build/main'
{ BuildRest } = require './build/rest'

exports.build = ->
  await IO.ensure SRC
  await IO.ensure LIB

  await BuildMain()
  await BuildRest()
