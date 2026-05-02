(function() {
  var Jasmine;

  Jasmine = require('jasmine');

  exports.CreateJasmine = function() {
    var jasmine;
    jasmine = new Jasmine();
    jasmine.loadConfigFile('spec/support/jasmine.json');
    jasmine.configureDefaultReporter({
      showColors: true
    });
    jasmine.exitOnCompletion = false;
    return jasmine;
  };

}).call(this);
