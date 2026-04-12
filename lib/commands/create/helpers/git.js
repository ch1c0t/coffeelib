(function() {
  var execSync;

  ({execSync} = require('child_process'));

  global.git = {
    name: execSync('git config user.name').toString().trim(),
    email: execSync('git config user.email').toString().trim()
  };

}).call(this);
