`{ Task } = require "${project.name}"

global.StartAndStopServerForEachExample = ({ server_path, cwd }) ->
  beforeEach ->
    @server = await Task
      run: server_path
      inside_of: cwd

  afterEach ->
    @server.stop()`;
