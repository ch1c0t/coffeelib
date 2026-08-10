{ exists } = IO.sync

{ TemplateFile } = require './TemplateFile'

exports.Template = bow
  init: (input) ->
    path = "#{COFFEELIB.path}/node_modules/coffeelib.templates/lib/#{input}"
    
    if exists path
      @exists = true
      ext = '.js'
    else if exists input
      @exists = true
      ext = '.coffee'
      path = input
    else
      @error = "No template directory was found at #{path}"

    if @exists
      metafile = "#{path}/template.coffee"

      if exists metafile
        @metafile = metafile

        @type = 'complex'
        base = "#{path}/base"
      else
        @type = 'simple'
        base = path

      files = glob.sync "#{base}/**/*", nodir: yes
      @files = for file in files
        TemplateFile
          ext: ext
          path: file
          template_path: base
