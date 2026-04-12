(function() {
  var BuildMain, BuildRest;

  ({BuildMain} = require('./build/main'));

  ({BuildRest} = require('./build/rest'));

  exports.build = async function() {
    await IO.ensure(SRC);
    await IO.ensure(LIB);
    await BuildMain();
    return (await BuildRest());
  };

}).call(this);
