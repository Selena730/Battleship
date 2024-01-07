require 'simplecov'
SimpleCov.start do
  add_filter '/spec/'
end


require_relative '../lib/board'
require_relative '../lib/ship'
require_relative '../lib/cell'
