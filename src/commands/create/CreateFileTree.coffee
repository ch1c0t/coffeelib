{ Template } = require './Template'
{ CreateProject } = require './CreateProject'

exports.CreateFileTree = (variables) ->
  { name, template } = variables
  template = Template template

  if template.exists
    project = await CreateProject { name, template }
    for file in template.files
      pathToNewFile = project.create_new_file_from file
      console.log pathToNewFile
    project.dir
  else
    console.error template.error
    process.exit 1
