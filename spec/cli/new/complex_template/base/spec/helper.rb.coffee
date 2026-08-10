"""
require 'open3'

def cli string = ''
  binary = "./bin/#{project.name}"
  command = "\#{binary} \#{string}"
  
  stdout, stderr, status = Open3.capture3 command
  exit_code = status.exitstatus

  unless exit_code == 0
    fail "'\#{command}' exited with the exit code \#{exit_code}"
  end

  [stdout, stderr]
end
"""
