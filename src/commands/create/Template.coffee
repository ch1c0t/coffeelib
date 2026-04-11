{ existsSync } = require 'fs'
{ bow } = require '@ch1c0t/bow'
glob = require 'glob'

exports.Template = bow
  init: (name) ->
    @name = name
    @path = "#{ROOT}/lib/commands/create/templates/#{name}"
    
    if existsSync @path
      @exists = true
      @files = glob.sync "#{@path}/**/*", nodir: yes
    else
      @error = "No template directory was found at #{@path}"
