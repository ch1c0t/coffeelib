(function() {
  var Project, exists, mkdir;

  ({exists, mkdir} = IO.sync);

  ({Project} = require('./Project'));

  exports.CreateProject = function({name, template}) {
    var dir;
    dir = `${CWD}/${name}`;
    if (exists(dir)) {
      console.error(`${dir} already exists.`);
      process.exit(1);
    } else {
      mkdir(dir);
    }
    return Project({name, template, dir});
  };

}).call(this);
