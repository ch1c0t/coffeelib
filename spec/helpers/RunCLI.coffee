{ sh } = require '@ch1c0t/sh'

global.RunCLI = (string) ->
  env = { ...process.env, NPM_INSTALL_OPTIONS: '--offline' }
  await sh "#{ENV.cli} #{string}",
    cwd: ENV.tmp
    env: env
