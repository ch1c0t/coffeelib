global.CWD = process.cwd()
global.SRC = "#{CWD}/src"
global.LIB = "#{CWD}/lib"

glob = require 'glob'
files = glob.sync "#{SRC}/**/*", nodir: yes

{ CompileFile } = require './compile/CompileFile'
for file in files
  CompileFile file
