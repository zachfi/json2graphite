$:.insert(0, File.join([File.dirname(__FILE__), "..", "lib"]))

require 'rubygems'
require 'mocha/api'
require 'mocha/setup'
require 'rspec'
require 'json2graphite'

def fixture(name)
  path = File.join([File.dirname(__FILE__), 'fixtures', name])
  return path
end

RSpec.configure do |config|
  config.mock_with :mocha
end
