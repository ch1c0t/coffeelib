(function() {
  global.jsonify = function(object) {
    return JSON.stringify(object, null, 2);
  };

}).call(this);
