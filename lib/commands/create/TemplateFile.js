(function() {
  require('./String');

  exports.TemplateFile = bow({
    init: function({path, template_path}) {
      this.path = path;
      this.template_path = template_path;
      return this.relative_path = path.delete_prefix(`${template_path}/`);
    },
    methods: {
      transpose_to: function(dir) {
        if (this.path.endsWith('.js')) {
          return `${dir}/${this.relative_path}`.delete_suffix('.js');
        } else {
          return `${dir}/${this.relative_path}`;
        }
      },
      endsWith: function(suffix) {
        return this.path.endsWith(suffix);
      },
      read: function() {
        return IO.read(this.path);
      }
    }
  });

}).call(this);
