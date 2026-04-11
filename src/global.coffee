require '@ch1c0t/io'

global.CWD = process.cwd()
global.SRC = "#{CWD}/src"
global.LIB = "#{CWD}/lib"

{ dirname } = require 'path'
global.ROOT = dirname __dirname
