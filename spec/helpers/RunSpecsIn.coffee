{ sh } = require '@ch1c0t/sh'

global.RunSpecsIn = (path) ->
  await sh "npm test",
    cwd: path
