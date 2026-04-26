{ dirname } = require 'path'
{ compile } = require 'coffeescript'
require './String'

require '@ch1c0t/io'
{
  mkdir
  read
  write
} = IO.sync

exports.CompileRegularFile = (file) ->
  relative_path_to_file = file.delete_prefix "#{SRC}/"

  if file.endsWith '.coffee'
    path_to_new_file = ("#{LIB}/#{relative_path_to_file}".delete_suffix '.coffee') + '.js'
    mkdir dirname path_to_new_file

    code = read file
    js = compile code
    write path_to_new_file, js
