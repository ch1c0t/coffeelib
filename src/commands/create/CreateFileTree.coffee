{ dirname, join } = require 'path'
{ sh } = require '@ch1c0t/sh'

{ Template } = require './Template'
{ CreateProjectDirectory } = require './CreateProjectDirectory'
{ DerivePathToNewFile } = require './DerivePathToNewFile'
require './helpers'

exports.CreateFileTree = (variables) ->
  { name, template } = variables
  template = Template template

  if template.exists
    await CreateProjectDirectory name
    for file in template.files
      pathToNewFile = DerivePathToNewFile { file, prefix_to_remove: "#{template.path}/"}
      dirToNewFile = dirname pathToNewFile
      await IO.ensure dirToNewFile

      if file.endsWith '.js'
        code = await IO.read file
        output = eval code

        if text = output.text
          if filename = output.filename
            pathToNewFile = join dirToNewFile, filename
        else
          text = output

        await IO.write pathToNewFile, text
        if output.executable
          await sh "chmod +x #{pathToNewFile}"
      else
        await IO.copy file, pathToNewFile

      console.log pathToNewFile
  else
    console.error template.error
    process.exit 1
