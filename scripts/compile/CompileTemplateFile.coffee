{ dirname, basename } = require 'path'
require '@ch1c0t/io'
{ compile } = require 'coffeescript'
require './String'

hidden_files = [
  '.nvim.sock'
]

exports.CompileTemplateFile = (file) ->
  relative_path_to_file = file.delete_prefix "#{SRC}/"
  path_to_new_file =
    if file.endsWith '.coffee'
      ("#{LIB}/#{relative_path_to_file}".delete_suffix '.coffee') + '.js'
    else
      "#{LIB}/#{relative_path_to_file}"
  await IO.ensure dirname path_to_new_file

  if file.endsWith '.coffee'
    code = await IO.read file
    js = compile code, bare: true
    await IO.write path_to_new_file, js
  else
    unless (basename file) in hidden_files
      await IO.copy file, path_to_new_file
