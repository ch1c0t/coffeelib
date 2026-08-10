{ mkdir, write } = IO.sync

->
  cli_dir = "#{@dir}/src.source/bin/#{@name}"
  mkdir cli_dir

  help_message = """
  A custom help message for #{@name}.
  """
  write "#{cli_dir}/help", help_message
