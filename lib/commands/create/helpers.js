(function() {
  var basename, file, files, i, len, name;

  ({basename} = require('path'));

  files = glob.sync(`${__dirname}/helpers/*.js`, {
    nodir: true
  });

  for (i = 0, len = files.length; i < len; i++) {
    file = files[i];
    name = basename(file, '.js');
    require(`./helpers/${name}`);
  }

}).call(this);
