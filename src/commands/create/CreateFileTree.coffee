{ dirname } = require 'path'
glob = require 'glob'

{ DerivePathToNewFile } = require './DerivePathToNewFile'
require './jsonify'

exports.CreateFileTree = (variables) ->
  { name, version, template } = variables

  templatePath = "#{ROOT}/lib/commands/create/templates/#{template}"

  if await IO.exist templatePath
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

      console.log pathToNewFile
  else
    console.error "No template directory was found at #{templatePath}"
    process.exit 1
