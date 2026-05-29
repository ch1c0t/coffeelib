{ exists } = IO.sync

{ TemplateFile } = require './TemplateFile'

exports.Template = bow
  init: (input) ->
    @name = input
    @path = "#{COFFEELIB.path}/node_modules/coffeelib.templates/lib/#{input}"
    
    if exists @path
      @exists = true
      @ext = '.js'
    else if exists input
      @exists = true
      @ext = '.coffee'
      @path = input
    else
      @error = "No template directory was found at #{@path}"

    if @exists
      files = glob.sync "#{@path}/**/*", nodir: yes
      @files = for file in files
        TemplateFile
          ext: @ext
          path: file
          template_path: @path
