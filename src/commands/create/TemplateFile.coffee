require './String'
{ read } = IO.sync

exports.TemplateFile = bow
  init: ({ path, template_path}) ->
    @path = path
    @template_path = template_path
    @relative_path = path.delete_prefix "#{template_path}/"
  methods:
    transpose_to: (dir) ->
      if @path.endsWith '.js'
        "#{dir}/#{@relative_path}".delete_suffix '.js'
      else
        "#{dir}/#{@relative_path}"
    endsWith: (suffix) ->
      @path.endsWith suffix
    read: ->
      read @path
