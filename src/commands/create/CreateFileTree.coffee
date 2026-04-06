{ dirname } = require 'path'
glob = require 'glob'

{ DerivePathToNewFile } = require './DerivePathToNewFile'
require './jsonify'

exports.CreateFileTree = (variables) ->
  { name, version } = variables

  templateName = 'basic'
  templatePath = "#{ROOT}/lib/commands/create/templates/#{templateName}"

  files = glob.sync "#{templatePath}/**/*", nodir: yes
  for file in files
    pathToNewFile = DerivePathToNewFile { file, prefix_to_remove: "#{templatePath}/"}
    await IO.ensure dirname pathToNewFile

    if file.endsWith '.js'
      code = await IO.read file
      output = eval code
      await IO.write pathToNewFile, output
    else
      await IO.copy file, pathToNewFile
