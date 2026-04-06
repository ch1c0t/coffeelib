require './String'

exports.DerivePathToNewFile = ({ file, prefix_to_remove }) ->
  relativePathToFile = file.delete_prefix "#{prefix_to_remove}"

  if file.endsWith '.js'
    "#{DIR}/#{relativePathToFile}".delete_suffix '.js'
  else
    "#{DIR}/#{relativePathToFile}"
