global.RunCLI = (string) ->
  await sh "#{ENV.cli} #{string}",
    cwd: ENV.tmp
