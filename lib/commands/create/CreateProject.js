(function() {
  var Project;

  ({Project} = require('./Project'));

  exports.CreateProject = async function({name, template}) {
    var dir;
    dir = `${CWD}/${name}`;
    if (IO.exist(dir)) {
      console.error(`${dir} already exists.`);
      process.exit(1);
    } else {
      await IO.mkdir(dir);
    }
    return Project({name, template, dir});
  };

}).call(this);
