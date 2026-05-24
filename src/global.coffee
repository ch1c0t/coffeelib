require '@ch1c0t/io'

global.CWD = process.cwd()
global.SRC = "#{CWD}/src"
global.LIB = "#{CWD}/lib"

{ dirname } = require 'path'
path = dirname __dirname

package_spec = require '../package.json'
{ version } = package_spec


global.COFFEELIB = global.coffeelib = {
  path
  version
  version_or_path: if version.endsWith 'dev' then "file:#{path}" else "^#{version}"
}

global.glob = require 'glob'
