# frozen_string_literal: true

namespace :spec do
  desc 'Run test suite'
  task :test, [:is_coverage] do |_, args|
    $LOAD_PATH.unshift('test')
    require 'test_helper'

    Dir.glob('./test/**/*_test.rb').sort.each { |r| require r }

    params = ['--no-plugins']
    params.pop unless args[:is_coverage]

    tests_passed = Minitest.run(params)

    exit(tests_passed ? 0 : 1)
  end
end
