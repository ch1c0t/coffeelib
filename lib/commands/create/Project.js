(function() {
  var ProjectFile;

  ({ProjectFile} = require('./ProjectFile'));

  require('./helpers');

  exports.Project = bow({
    init: {
      name: function() {
        return this.value;
      },
      template: function() {
        return this.value;
      },
      dir: function() {
        return this.value;
      }
    },
    methods: {
      create_new_file_from: async function(template_file) {
        var code, filename, output, project, project_file, text;
        project_file = ProjectFile(template_file.transpose_to(this.dir));
        if (template_file.endsWith('.js')) {
          code = (await template_file.read());
          project = this;
          output = eval(code);
          if (text = output.text) {
            if (filename = output.filename) {
              project_file.change_filename_to(filename);
            }
          } else {
            text = output;
          }
          await project_file.write(text);
          if (output.executable) {
            await sh(`chmod +x ${project_file.path}`);
          }
        } else {
          await project_file.copy(template_file.path);
        }
        return project_file.path;
      }
    }
  });

}).call(this);
