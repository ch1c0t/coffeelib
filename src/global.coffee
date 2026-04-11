require '@ch1c0t/io'

global.CWD = process.cwd()
global.SRC = "#{CWD}/src"
global.LIB = "#{CWD}/lib"

{ dirname } = require 'path'

package_spec = require '../package.json'
{ version } = package_spec

global.COFFEELIB = global.coffeelib = {
  version
  path: dirname __dirname
}
