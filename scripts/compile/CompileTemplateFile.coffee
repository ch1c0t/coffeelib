{ dirname, basename } = require 'path'
{ compile } = require 'coffeescript'
require './String'

hidden_files = [
  '.nvim.sock'
]

require '@ch1c0t/io'
{
  mkdir
  read
  write
  copy
} = IO.sync

exports.CompileTemplateFile = (file) ->
  relative_path_to_file = file.delete_prefix "#{SRC}/"
  path_to_new_file =
    if file.endsWith '.coffee'
      ("#{LIB}/#{relative_path_to_file}".delete_suffix '.coffee') + '.js'
    else
      "#{LIB}/#{relative_path_to_file}"
  mkdir dirname path_to_new_file

  if file.endsWith '.coffee'
    code = read file
    js = compile code, bare: true
    write path_to_new_file, js
  else
    unless (basename file) in hidden_files
      copy file, path_to_new_file
