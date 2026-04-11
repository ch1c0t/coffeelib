{ existsSync } = require 'fs'

{ TemplateFile } = require './TemplateFile'

exports.Template = bow
  init: (name) ->
    @name = name
    @path = "#{COFFEELIB.path}/lib/commands/create/templates/#{name}"
    
    if existsSync @path
      @exists = true

      files = glob.sync "#{@path}/**/*", nodir: yes
      @files = for file in files
        TemplateFile
          path: file
          template_path: @path
    else
      @error = "No template directory was found at #{@path}"
