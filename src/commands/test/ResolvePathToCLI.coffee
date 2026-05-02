{ exists } = IO.sync

exports.ResolvePathToCLI = ->
  package_json = "#{process.cwd()}/package.json"
  if exists package_json
    spec = require package_json
    { name } = spec
    if name
      cli_path = "#{process.cwd()}/bin/#{name}"
      if exists cli_path
        cli_path
