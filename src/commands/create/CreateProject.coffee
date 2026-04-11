{ Project } = require './Project'

exports.CreateProject = ({ name, template }) ->
  global.DIR = "#{CWD}/#{name}"

  if IO.exist DIR
    console.error "#{DIR} already exists."
    process.exit 1
  else
    await IO.mkdir DIR

  dir = DIR
  Project { name, template, dir }
