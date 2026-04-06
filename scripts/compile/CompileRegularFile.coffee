{ dirname } = require 'path'
require '@ch1c0t/io'
{ compile } = require 'coffeescript'
require './String'

exports.CompileRegularFile = (file) ->
  relative_path_to_file = file.delete_prefix "#{SRC}/"

  if file.endsWith '.coffee'
    path_to_new_file = ("#{LIB}/#{relative_path_to_file}".delete_suffix '.coffee') + '.js'
    await IO.ensure dirname path_to_new_file

    code = await IO.read file
    js = compile code
    await IO.write path_to_new_file, js
