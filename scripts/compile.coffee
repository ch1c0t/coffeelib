global.CWD = process.cwd()
global.SRC = "#{CWD}/src"
global.LIB = "#{CWD}/lib"

{ CompileAll } = require './compile/CompileAll'
CompileAll()
