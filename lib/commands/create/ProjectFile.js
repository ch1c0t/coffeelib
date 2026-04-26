(function() {
  var copy, dirname, join, mkdir, write;

  ({dirname, join} = require('path'));

  ({mkdir, write, copy} = IO.sync);

  exports.ProjectFile = bow({
    init: function(path) {
      this.path = path;
      this.dir = dirname(path);
      return mkdir(this.dir);
    },
    methods: {
      change_filename_to: function(new_filename) {
        return this.path = join(this.dir, new_filename);
      },
      write: function(text) {
        return write(this.path, text);
      },
      copy: function(file) {
        return copy(file, this.path);
      }
    }
  });

}).call(this);
