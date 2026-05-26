{ compile } = require 'coffeescript'
{ read } = IO.sync

require './String'

exports.TemplateFile = bow
  init: ({ ext, path, template_path}) ->
    @ext = ext
    @path = path
    @template_path = template_path
    @relative_path = path.delete_prefix "#{template_path}/"
  methods:
    transpose_to: (dir) ->
      if @path.endsWith @ext
        "#{dir}/#{@relative_path}".delete_suffix @ext
      else
        "#{dir}/#{@relative_path}"
    endsWith: (suffix) ->
      @path.endsWith suffix
    read: ->
      read @path
    is_evaluable: ->
      @path.endsWith @ext
    output_for: ({ project }) ->
      code = await @read()

      switch @ext
        when '.js'
          eval code
        when '.coffee'
          eval compile code, bare: true
