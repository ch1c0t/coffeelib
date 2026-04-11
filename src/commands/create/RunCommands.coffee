NPM_INSTALL_OPTIONS = process.env.NPM_INSTALL_OPTIONS or "--prefer-offline"
NPM_INSTALL_COMMAND = "npm install #{NPM_INSTALL_OPTIONS}"

exports.RunCommands = ->
  await sh NPM_INSTALL_COMMAND, cwd: DIR
  await sh 'npm run build', cwd: DIR
