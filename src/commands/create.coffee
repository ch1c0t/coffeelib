{ CreateFileTree } = require './create/CreateFileTree'
{ RunCommands } = require './create/RunCommands'

package_spec = require '../../package.json'
{ version } = package_spec

exports.create = ({ name, template = 'basic' }) ->
  await CreateFileTree {
    name
    template
    version
  }

  await RunCommands()
