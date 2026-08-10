{ ProjectFile } = require './ProjectFile'
require './helpers'

exports.Project = bow
  init:
    name: null
    template: null
    dir: null
  setup: ->
    await @create_files()
    @
  methods:
    create_files: ->
      for template_file in @template.files
        path_to_project_file = await @create_new_file_from template_file
        console.log path_to_project_file
    create_new_file_from: (template_file) ->
      project_file = ProjectFile template_file.transpose_to @dir

      if template_file.is_evaluable()
        project = @
        output = await template_file.output_for { project }

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
