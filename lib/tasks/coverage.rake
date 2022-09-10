# frozen_string_literal: true

namespace :spec do
  desc 'Create test coverage'
  task :coverage do
    ENV['COVERAGE'] = 'true'
    Rake::Task['spec:test'].invoke(true)
  end
end
