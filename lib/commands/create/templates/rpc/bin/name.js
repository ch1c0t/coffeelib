var executable, filename, text;

executable = true;

filename = project.name;

text = `#!/usr/bin/env node

var path = require('path')
root = path.join(__dirname, '../lib')
require(root + '/cli').run()`;

({executable, filename, text});
