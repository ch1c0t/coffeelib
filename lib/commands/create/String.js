(function() {
  String.prototype.delete_prefix = function(prefix) {
    if (this.startsWith(prefix)) {
      return this.slice(prefix.length);
    }
  };

  String.prototype.delete_suffix = function(suffix) {
    if (this.endsWith(suffix)) {
      return this.slice(0, -suffix.length);
    }
  };

}).call(this);
