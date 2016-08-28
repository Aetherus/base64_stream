module Base64Stream
  class Stream
    def initialize(codec_class, input, output, strict)
      @strict = strict
      @codec = codec_class.new(input, output, strict)
    end

    def stream
      while chunk = @codec.read_chunk
        @codec.write_chunk(chunk)
      end
    end
  end
end
