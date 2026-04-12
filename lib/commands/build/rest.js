(function() {
  var BuildFile, BuildRest, coffee, dirname;

  coffee = require('coffeescript');

  ({dirname} = require('path'));

  BuildRest = async function() {
    var file, files, i, len, ref, results;
    files = glob.sync(`${SRC}/**/*.coffee`, {
      nodir: true
    });
    ref = files.slice(1);
    results = [];
    for (i = 0, len = ref.length; i < len; i++) {
      file = ref[i];
      results.push((await BuildFile(file)));
    }
    return results;
  };

  BuildFile = async function(file) {
    var output, source, target;
    source = (await IO.read(file));
    output = coffee.compile(source);
    target = (file.replace(SRC, LIB)).slice(0, -6) + 'js'; // without .coffee
    await IO.ensure(dirname(target));
    return (await IO.write(target, output));
  };

  module.exports = {BuildRest, BuildFile};

}).call(this);
