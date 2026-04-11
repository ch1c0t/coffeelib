exports.CreateProject = ({ name, template }) ->
  global.DIR = "#{CWD}/#{name}"

  if IO.exist DIR
    console.error "#{DIR} already exists."
    process.exit 1
  else
    await IO.mkdir DIR

  dir = DIR
  Project { name, template, dir }

{ dirname, join } = require 'path'
{ DerivePathToNewFile } = require './DerivePathToNewFile'
require './helpers'

Project = bow
  init:
    name: -> @value
    template: -> @value
    dir: -> @value
  methods:
    create_new_file_from: (file) ->
      pathToNewFile = DerivePathToNewFile { file, prefix_to_remove: "#{@template.path}/"}
      dirToNewFile = dirname pathToNewFile
      await IO.ensure dirToNewFile

      if file.endsWith '.js'
        code = await IO.read file
        project = @
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

      pathToNewFile
