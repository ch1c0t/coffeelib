{ CreateFileTree } = require './create/CreateFileTree'
{ RunCommands } = require './create/RunCommands'

exports.create = ({ name, template = 'basic' }) ->
  { sh } = require '@ch1c0t/sh'
  global.sh = sh

  await CreateFileTree {
    name
    template
  }

  await RunCommands()
