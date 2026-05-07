exports.StartTasks = ({ inside_of })->
  files = glob.sync "#{process.cwd()}/spec/tasks/*.coffee"
  for file in files
    task = await Task
      run: file
      inside_of: inside_of
    AtExit -> task.stop()
    task
