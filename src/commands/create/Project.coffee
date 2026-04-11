{ ProjectFile } = require './ProjectFile'
require './helpers'

exports.Project = bow
  init:
    name: -> @value
    template: -> @value
    dir: -> @value
  methods:
    create_new_file_from: (template_file) ->
      project_file = ProjectFile template_file.transpose_to @dir

      if template_file.endsWith '.js'
        code = await template_file.read()
        project = @
        output = eval code

        if text = output.text
          if filename = output.filename
            project_file.change_filename_to filename
        else
          text = output

        await project_file.write text
        if output.executable
          await sh "chmod +x #{project_file.path}"
      else
        await project_file.copy template_file.path

      project_file.path
