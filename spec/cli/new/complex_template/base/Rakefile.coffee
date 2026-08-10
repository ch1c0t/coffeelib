"""
task :bgem do
  sh 'bundle exec bgem'
end

task :build do
  sh 'shards build'
end

task :default => [:bgem, :build]
"""
