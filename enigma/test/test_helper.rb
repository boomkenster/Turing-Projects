require 'simplecov'
SimpleCov.start
lib_dir = File.expand_path('../lib', __dir__)
$LOAD_PATH.unshift(lib_dir)

require 'minitest/autorun'
require 'minitest/pride'
