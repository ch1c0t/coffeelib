path = require 'path'

{ CreateFileTree } = require './create/CreateFileTree'
{ RunCommands } = require './create/RunCommands'

CWD = process.cwd()
global.ROOT = path.dirname path.dirname __dirname

package_spec = require '../../package.json'
{ version } = package_spec

exports.create = ({ name, template = 'basic' }) ->
  await CreateFileTree {
    name
    template
    version
  }

  await RunCommands()
