(function() {
  var CreateGitRepository, NPM_INSTALL_COMMAND, NPM_INSTALL_OPTIONS;

  NPM_INSTALL_OPTIONS = process.env.NPM_INSTALL_OPTIONS || "--prefer-offline";

  NPM_INSTALL_COMMAND = `npm install ${NPM_INSTALL_OPTIONS}`;

  exports.RunCommands = async function({inside_of}) {
    var dir;
    dir = inside_of;
    await sh(NPM_INSTALL_COMMAND, {
      cwd: dir
    });
    await sh('npm run build', {
      cwd: dir
    });
    return (await CreateGitRepository({
      inside_of: dir
    }));
  };

  CreateGitRepository = async function({inside_of}) {
    var dir;
    dir = inside_of;
    await sh("git init", {
      cwd: dir
    });
    await sh("git add -A", {
      cwd: dir
    });
    return (await sh("git commit -m 'Initial commit'", {
      cwd: dir
    }));
  };

}).call(this);
