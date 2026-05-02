(function() {
  var exists;

  ({exists} = IO.sync);

  exports.ResolvePathToCLI = function() {
    var cli_path, name, package_json, spec;
    package_json = `${process.cwd()}/package.json`;
    if (exists(package_json)) {
      spec = require(package_json);
      ({name} = spec);
      if (name) {
        cli_path = `${process.cwd()}/bin/${name}`;
        if (exists(cli_path)) {
          return cli_path;
        }
      }
    }
  };

}).call(this);
