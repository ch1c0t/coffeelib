(function() {
  var TemplateFile, exists;

  ({exists} = IO.sync);

  ({TemplateFile} = require('./TemplateFile'));

  exports.Template = bow({
    init: function(input) {
      var file, files;
      this.name = input;
      this.path = `${COFFEELIB.path}/node_modules/coffeelib.templates/lib/${input}`;
      if (exists(this.path)) {
        this.exists = true;
        this.ext = '.js';
      } else if (exists(input)) {
        this.exists = true;
        this.ext = '.coffee';
        this.path = input;
      } else {
        this.error = `No template directory was found at ${this.path}`;
      }
      if (this.exists) {
        files = glob.sync(`${this.path}/**/*`, {
          nodir: true
        });
        return this.files = (function() {
          var i, len, results;
          results = [];
          for (i = 0, len = files.length; i < len; i++) {
            file = files[i];
            results.push(TemplateFile({
              ext: this.ext,
              path: file,
              template_path: this.path
            }));
          }
          return results;
        }).call(this);
      }
    }
  });

}).call(this);
