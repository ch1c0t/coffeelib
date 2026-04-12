(function() {
  var NPM_INSTALL_COMMAND, NPM_INSTALL_OPTIONS;

  NPM_INSTALL_OPTIONS = process.env.NPM_INSTALL_OPTIONS || "--prefer-offline";

  NPM_INSTALL_COMMAND = `npm install ${NPM_INSTALL_OPTIONS}`;

  exports.RunCommands = async function({inside_of}) {
    var dir;
    dir = inside_of;
    await sh(NPM_INSTALL_COMMAND, {
      cwd: dir
    });
    return (await sh('npm run build', {
      cwd: dir
    }));
  };

}).call(this);
