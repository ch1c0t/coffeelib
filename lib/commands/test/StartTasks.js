(function() {
  exports.StartTasks = async function({inside_of}) {
    var file, files, i, len, results, task;
    files = glob.sync(`${process.cwd()}/spec/tasks/*.coffee`);
    results = [];
    for (i = 0, len = files.length; i < len; i++) {
      file = files[i];
      task = (await Task({
        run: file,
        inside_of: inside_of
      }));
      AtExit(function() {
        return task.stop();
      });
      results.push(task);
    }
    return results;
  };

}).call(this);
