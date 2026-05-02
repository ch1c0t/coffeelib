(function() {
  require('./global');

  exports.run = function() {
    var _node, _program, build, command, create, name, printHelp, template, test, version, watch;
    [_node, _program, command] = process.argv;
    switch (command) {
      case 'new':
        ({create} = require('./commands/create'));
        [name, template] = process.argv.slice(3, 5);
        return create({name, template});
      case 'watch':
        ({watch} = require('./commands/watch'));
        return watch();
      case 'build':
        ({build} = require('./commands/build'));
        return build();
      case 'test':
        ({test} = require('./commands/test'));
        return test();
      case 'version':
      case '--version':
      case '-v':
        ({version} = require('../package.json'));
        return console.log(version);
      case 'help':
        ({printHelp} = require('./commands/help'));
        return printHelp();
      default:
        ({printHelp} = require('./commands/help'));
        return printHelp();
    }
  };

}).call(this);
