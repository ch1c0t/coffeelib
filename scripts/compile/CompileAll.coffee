glob = require 'glob'
{ CompileFile } = require './CompileFile'

exports.CompileAll = ->
  files = glob.sync "#{SRC}/**/*", nodir: yes

  for file in files
    CompileFile file
