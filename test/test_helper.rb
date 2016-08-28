p Process.getrlimit(:AS)
p Process.getrlimit(:RSS)

Process.setrlimit(:AS, 50 * 1024 * 1024)
Process.setrlimit(:RSS, 50 * 1024 * 1024)

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'base64_stream'

require 'minitest/autorun'
