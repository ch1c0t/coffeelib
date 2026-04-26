(function() {
  var BuildFile, BuildRest, compile, dirname, mkdir, read, write;

  ({dirname} = require('path'));

  ({compile} = require('coffeescript'));

  ({read, write, mkdir} = IO.sync);

  BuildRest = function() {
    var file, files, i, len, ref, results;
    files = glob.sync(`${SRC}/**/*.coffee`, {
      nodir: true
    });
    ref = files.slice(1);
    results = [];
    for (i = 0, len = ref.length; i < len; i++) {
      file = ref[i];
      results.push(BuildFile(file));
    }
    return results;
  };

  BuildFile = function(file) {
    var output, source, target;
    source = read(file);
    output = compile(source);
    target = (file.replace(SRC, LIB)).slice(0, -6) + 'js'; // without .coffee
    mkdir(dirname(target));
    return write(target, output);
  };

  module.exports = {BuildRest, BuildFile};

}).call(this);
