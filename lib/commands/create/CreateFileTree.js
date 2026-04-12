(function() {
  var CreateProject, Template;

  ({Template} = require('./Template'));

  ({CreateProject} = require('./CreateProject'));

  exports.CreateFileTree = async function(variables) {
    var file, i, len, name, pathToNewFile, project, ref, template;
    ({name, template} = variables);
    template = Template(template);
    if (template.exists) {
      project = (await CreateProject({name, template}));
      ref = template.files;
      for (i = 0, len = ref.length; i < len; i++) {
        file = ref[i];
        pathToNewFile = (await project.create_new_file_from(file));
        console.log(pathToNewFile);
      }
      return project.dir;
    } else {
      console.error(template.error);
      return process.exit(1);
    }
  };

}).call(this);
