(function() {
  var CreateTestEnvironment;

  require('@ch1c0t/ext');

  ({CreateTestEnvironment} = require('./test/CreateTestEnvironment'));

  exports.test = async function() {
    global.TE = (await CreateTestEnvironment());
    p("Created a test environment directory at");
    p(TE.dir);
    return TE.jasmine.execute().then(function(info) {
      if (info.overallStatus === 'failed') {
        return process.exit(3);
      }
    }).catch(function(error) {
      console.error(error);
      return process.exit(3);
    });
  };

}).call(this);
