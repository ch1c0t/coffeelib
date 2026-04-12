(function() {
  var dirname, join, mkdirSync;

  ({dirname, join} = require('path'));

  ({mkdirSync} = require('fs'));

  exports.ProjectFile = bow({
    init: function(path) {
      this.path = path;
      this.dir = dirname(path);
      return mkdirSync(this.dir, {
        recursive: true
      });
    },
    methods: {
      change_filename_to: function(new_filename) {
        return this.path = join(this.dir, new_filename);
      },
      write: function(text) {
        return IO.write(this.path, text);
      },
      copy: function(file) {
        return IO.copy(file, this.path);
      }
    }
  });

}).call(this);
