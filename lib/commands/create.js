(function() {
  var CreateFileTree, RunCommands, bow, sh;

  ({sh} = require('@ch1c0t/sh'));

  global.sh = sh;

  ({bow} = require('@ch1c0t/bow'));

  global.bow = bow;

  ({CreateFileTree} = require('./create/CreateFileTree'));

  ({RunCommands} = require('./create/RunCommands'));

  exports.create = async function({name, template = 'default'}) {
    var dir;
    dir = (await CreateFileTree({name, template}));
    return (await RunCommands({
      inside_of: dir
    }));
  };

}).call(this);
