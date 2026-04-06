{ CompileTemplateFile } = require './CompileTemplateFile'
{ CompileRegularFile } = require './CompileRegularFile'

PATH_TO_TEMPLATES = "#{SRC}/commands/create/templates"

exports.CompileFile = (path) ->
  if path.startsWith PATH_TO_TEMPLATES
    CompileTemplateFile path
  else
    CompileRegularFile path
