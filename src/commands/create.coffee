{ sh } = require '@ch1c0t/sh'
global.sh = sh

{ bow } = require '@ch1c0t/bow'
global.bow = bow

{ CreateFileTree } = require './create/CreateFileTree'
{ RunCommands } = require './create/RunCommands'

exports.create = ({ name, template = 'basic' }) ->
  dir = await CreateFileTree {
    name
    template
  }

  await RunCommands
    inside_of: dir
