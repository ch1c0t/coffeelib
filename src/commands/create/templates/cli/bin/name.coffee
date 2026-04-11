executable = yes
filename = name
text = """
#!/usr/bin/env node

var path = require('path')
root = path.join(__dirname, '../lib')
require(root + '/cli').run()
"""

{
  executable
  filename
  text
}
