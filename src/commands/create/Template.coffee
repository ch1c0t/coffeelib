{ existsSync } = require 'fs'
{ bow } = require '@ch1c0t/bow'

exports.Template = bow
  init: (name) ->
    @name = name
    @path = "#{ROOT}/lib/commands/create/templates/#{name}"
    
    if existsSync @path
      @exists = true
    else
      @error = "No template directory was found at #{@path}"
