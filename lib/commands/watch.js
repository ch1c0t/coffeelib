(function() {
  var BuildFile, BuildMain, build, chokidar;

  chokidar = require('chokidar');

  ({build} = require('./build'));

  ({BuildFile} = require('./build/rest'));

  ({BuildMain} = require('./build/main'));

  exports.watch = async function() {
    var watcher;
    await build();
    watcher = chokidar.watch(SRC);
    return watcher.on('all', async function(event, path) {
      console.log(event, path);
      if (event === 'add' || event === 'change') {
        switch (path) {
          case `${SRC}/main.coffee`:
            return (await BuildMain());
          default:
            return (await BuildFile(path));
        }
      }
    });
  };

}).call(this);
