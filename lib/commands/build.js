(function() {
  var BuildMain, BuildRest, mkdir;

  ({BuildMain} = require('./build/main'));

  ({BuildRest} = require('./build/rest'));

  ({mkdir} = IO.sync);

  exports.build = function() {
    mkdir(SRC);
    mkdir(LIB);
    BuildMain();
    return BuildRest();
  };

}).call(this);
