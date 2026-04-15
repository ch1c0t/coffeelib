{ bow } = require '@ch1c0t/bow'
{ sh } = require '@ch1c0t/sh'

SourceFile = bow
  init: ({ path }) ->
    @path = path
    @relative_path = path.delete_prefix "#{SRC}/"
  methods:
    transpose_to: (dir) ->
      if @path.endsWith '.coffee'
        "#{dir}/#{@relative_path}".replace_suffix '.coffee', '.js'
      else
        "#{dir}/#{@relative_path}"

exports.RemoveFile = (path) ->
  source_file = SourceFile { path }
  target_file = source_file.transpose_to LIB

  sh "rm #{target_file}"
