path = require 'path'

{ CreateFileTree } = require './create/CreateFileTree'
{ RunCommands } = require './create/RunCommands'

CWD = process.cwd()
global.ROOT = path.dirname path.dirname __dirname

CreateProjectDirectory = (name) ->
  global.DIR = "#{CWD}/#{name}"

  if IO.exist DIR
    console.error "#{DIR} already exists."
    process.exit 1
  else
    await IO.mkdir DIR

package_spec = require '../../package.json'
{ version } = package_spec

exports.create = ({ name, template = 'basic' }) ->
  await CreateProjectDirectory name

  await CreateFileTree {
    name
    template
    version
  }

  await RunCommands()
