require 'rubocop/rake_task'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |task|
end

RuboCop::RakeTask.new(:rubocop) do |task|
  task.patterns = ['lib/**/*.rb', 'spec/**/*.rb', 'test/**/*.rb', 'Rakefile']
end

task default: :all

task :all do
  Rake::Task[:rubocop].invoke
  Rake::Task[:spec].invoke
end
