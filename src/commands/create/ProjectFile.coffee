{ dirname, join } = require 'path'
{ mkdir, write, copy } = IO.sync

exports.ProjectFile = bow
  init: (path) ->
    @path = path
    @dir = dirname path

    mkdir @dir
  methods:
    change_filename_to: (new_filename) ->
      @path = join @dir, new_filename
    write: (text) ->
      write @path, text
    copy: (file) ->
      copy file, @path
