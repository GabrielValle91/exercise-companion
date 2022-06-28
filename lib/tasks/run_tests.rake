require 'rspec/core/rake_task'

desc 'Run all rspec tests and open html to view coverage'
task :run_tests do
    Rake::Task['spec'].invoke
    sh("open coverage/index.html")
end