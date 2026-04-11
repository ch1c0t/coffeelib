{ CreateFileTree } = require './create/CreateFileTree'
{ RunCommands } = require './create/RunCommands'

exports.create = ({ name, template = 'basic' }) ->
  await CreateFileTree {
    name
    template
  }

  await RunCommands()
