{ Project } = require './Project'

exports.CreateProject = ({ name, template }) ->
  dir = "#{CWD}/#{name}"

  if IO.exist dir
    console.error "#{dir} already exists."
    process.exit 1
  else
    await IO.mkdir dir

  Project { name, template, dir }
