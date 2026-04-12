(function() {
  var TemplateFile, existsSync;

  ({existsSync} = require('fs'));

  ({TemplateFile} = require('./TemplateFile'));

  exports.Template = bow({
    init: function(name) {
      var file, files;
      this.name = name;
      this.path = `${COFFEELIB.path}/lib/commands/create/templates/${name}`;
      if (existsSync(this.path)) {
        this.exists = true;
        files = glob.sync(`${this.path}/**/*`, {
          nodir: true
        });
        return this.files = (function() {
          var i, len, results;
          results = [];
          for (i = 0, len = files.length; i < len; i++) {
            file = files[i];
            results.push(TemplateFile({
              path: file,
              template_path: this.path
            }));
          }
          return results;
        }).call(this);
      } else {
        return this.error = `No template directory was found at ${this.path}`;
      }
    }
  });

}).call(this);
