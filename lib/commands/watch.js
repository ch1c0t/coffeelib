(function() {
  var BuildFile, BuildMain, build, chokidar;

  chokidar = require('chokidar');

  ({build} = require('./build'));

  ({BuildFile} = require('./build/rest'));

  ({BuildMain} = require('./build/main'));

  exports.watch = function() {
    var watcher;
    build();
    watcher = chokidar.watch(SRC);
    return watcher.on('all', function(event, path) {
      console.log(event, path);
      if (event === 'add' || event === 'change') {
        switch (path) {
          case `${SRC}/main.coffee`:
            return BuildMain();
          default:
            return BuildFile(path);
        }
      }
    });
  };

}).call(this);
