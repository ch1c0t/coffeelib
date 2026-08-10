{ compile } = require 'coffeescript'
{ read } = IO.sync

module.exports = ->
  switch @template.type
    when 'simple'
      await @create_files()
    when 'complex'
      { metafile } = @template

      code = await read metafile

      project = @
      metafile_output = eval compile code, bare: true

      if typeof metafile_output is 'function'
        metafile_output.call @

      await @create_files()
  @
