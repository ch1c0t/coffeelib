{ existsSync } = require 'fs'

exports.Template = bow
  init: (name) ->
    @name = name
    @path = "#{COFFEELIB.path}/lib/commands/create/templates/#{name}"
    
    if existsSync @path
      @exists = true
      @files = glob.sync "#{@path}/**/*", nodir: yes
    else
      @error = "No template directory was found at #{@path}"
