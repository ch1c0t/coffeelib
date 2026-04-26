{ exists, mkdir } = IO.sync
{ Project } = require './Project'

exports.CreateProject = ({ name, template }) ->
  dir = "#{CWD}/#{name}"

  if exists dir
    console.error "#{dir} already exists."
    process.exit 1
  else
    mkdir dir

  Project { name, template, dir }
