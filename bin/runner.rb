require 'bundler'
Bundler.require

$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'lib')

require 'invalid_write_times'


InvalidWriteTime.new.invalid_write_times