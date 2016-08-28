require "base64_stream/version"

module Base64Stream
  autoload :Encoder, 'base64_stream/encoder'
  autoload :Decoder, 'base64_stream/decoder'
  autoload :Stream, 'base64_stream/stream'

  def self.encode(input, output, strict: false)
    Stream.new(Encoder, input, output, strict).stream
  end

  def self.decode(input, output, strict: false)
    Stream.new(Decoder, input, output, strict).stream
  end
end
