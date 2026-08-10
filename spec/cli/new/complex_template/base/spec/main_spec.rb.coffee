"""
require_relative 'helper'

describe 'cli' do
  it 'prints a help message' do
    stdout = cli '--help'
    expect(stdout.first).to start_with 'A help message for crystal-cli_project'
  end
end
"""
