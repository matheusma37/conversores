# frozen_string_literal: true

require 'simplecov'
SimpleCov.start do
  minimum_coverage 98
  add_filter '/test/'
end if ENV['COVERAGE']

require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use! [
  Minitest::Reporters::DefaultReporter.new({ color: true })
]

require_relative '../lib/conversor'
