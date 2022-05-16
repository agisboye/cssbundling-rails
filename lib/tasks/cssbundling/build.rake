namespace :css do
  desc "Build your CSS bundle"
  task :build do
    unless system "npm install && npm run build:css"
      raise "cssbundling-rails: Command css:build failed, ensure npm is installed and `npm run build:css` runs without errors"
    end
  end
end

if Rake::Task.task_defined?("assets:precompile")
  Rake::Task["assets:precompile"].enhance(["css:build"])
end

if Rake::Task.task_defined?("test:prepare")
  Rake::Task["test:prepare"].enhance(["css:build"])
elsif Rake::Task.task_defined?("db:test:prepare")
  Rake::Task["db:test:prepare"].enhance(["css:build"])
end
