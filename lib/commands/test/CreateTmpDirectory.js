(function() {
  var basename, mkdir, randomUUID;

  ({mkdir} = IO.sync);

  ({basename} = require('path'));

  ({randomUUID} = require('crypto'));

  exports.CreateTmpDirectory = function() {
    var name, path;
    name = `${basename(process.cwd())}.test.${process.pid}.${randomUUID()}`;
    path = `/tmp/${name}`;
    mkdir(path);
    return path;
  };

}).call(this);
