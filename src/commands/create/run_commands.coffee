exports.RunCommands = ->
  { sh } = require '@ch1c0t/sh'
  await sh 'npm install', cwd: DIR
  await sh 'npm run build', cwd: DIR
