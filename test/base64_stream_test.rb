require_relative 'test_helper'
require 'base64'
require 'securerandom'

class Base64StreamTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Base64Stream::VERSION
  end

  def test_that_it_encodes_data_in_loose_mode
    binstr = SecureRandom.random_bytes(1024)
    input = StringIO.new(binstr, 'rb')
    output = StringIO.new
    Base64Stream.encode(input, output, strict: false)
    result = output.tap(&:rewind).read
    assert_equal(Base64.encode64(binstr), result)
  end

  def test_that_it_encodes_data_in_strict_mode
    binstr = SecureRandom.random_bytes(1024)
    input = StringIO.new(binstr, 'rb')
    output = StringIO.new
    Base64Stream.encode(input, output, strict: true)
    result = output.tap(&:rewind).read
    assert_equal(Base64.strict_encode64(binstr), result)
  end

  def test_that_it_decodes_data_in_loose_mode
    base64 = SecureRandom.base64(1024).scan(/.{1,60}/).map{|chunk| chunk + "\n"}.join
    input = StringIO.new(base64, 'r')
    output = StringIO.new('', 'w+b')
    Base64Stream.decode(input, output, strict: false)
    result = output.tap(&:rewind).read
    assert_equal(Base64.decode64(base64), result)
  end

  def test_that_it_decodes_data_in_strict_mode
    base64 = SecureRandom.base64(1024)
    input = StringIO.new(base64, 'r')
    output = StringIO.new('', 'w+b')
    Base64Stream.decode(input, output, strict: true)
    result = output.tap(&:rewind).read
    assert_equal(Base64.strict_decode64(base64), result)
  end
end
