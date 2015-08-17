require "bundler/gem_tasks"
require 'ohai/version'
require "rubocop/rake_task"

begin
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new do |t|
    t.pattern = 'spec/**/*_spec.rb'
  end
rescue LoadError
  desc "rspec is not installed, this task is disabled"
  task :spec do
    abort "rspec is not installed. `(sudo) gem install rspec` to run unit tests"
  end
end

RuboCop::RakeTask.new do |task|
  task.options << "--display-cop-names"
end

task :default => :spec
