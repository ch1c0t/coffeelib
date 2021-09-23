{ BuildMain } = require './build/main'

exports.build = ->
  await IO.ensure SRC
  await IO.ensure LIB

  await BuildMain()
