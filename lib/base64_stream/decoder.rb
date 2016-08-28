module Base64Stream
  class Decoder
    def initialize(input, output, strict)
      @input, @output = input, output
      @strict = strict
      @output.binmode
    end

    def read_chunk
      return if @input.eof?
      base64 = @strict ? @input.read(60) : @input.readline.chomp!
      base64.unpack('m0')[0]
    end

    def write_chunk(binstr)
      @output.write(binstr)
    end
  end
end