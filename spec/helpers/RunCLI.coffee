{ sh } = require '@ch1c0t/sh'

global.RunCLI = (string) ->
  await sh "#{ENV.cli} #{string}",
    cwd: ENV.tmp
