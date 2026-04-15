NPM_INSTALL_OPTIONS = process.env.NPM_INSTALL_OPTIONS or "--prefer-offline"
NPM_INSTALL_COMMAND = "npm install #{NPM_INSTALL_OPTIONS}"

exports.RunCommands = ({ inside_of })->
  dir = inside_of

  await sh NPM_INSTALL_COMMAND, cwd: dir
  await sh 'npm run build', cwd: dir
  await CreateGitRepository inside_of: dir

CreateGitRepository = ({ inside_of }) ->
  dir = inside_of

  await sh "git init", cwd: dir
  await sh "git add -A", cwd: dir
  await sh "git commit -m 'Initial commit'", cwd: dir
