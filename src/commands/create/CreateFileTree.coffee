{ Template } = require './Template'
{ CreateProject } = require './CreateProject'

exports.CreateFileTree = (variables) ->
  { name, template } = variables
  template = Template template

  if template.exists
    project = await CreateProject { name, template }
    project.dir
  else
    console.error template.error
    process.exit 1
