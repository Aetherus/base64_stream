module Base64Stream
  class Encoder
    def initialize(input, output, strict)
      @input, @output = input, output
      @input.binmode
      @pack_mode = strict ? 'm0' : 'm'
    end

    def read_chunk
      return if @input.eof?
      @input.read(45)
    end

    def write_chunk(binstr)
      return 0 unless binstr
      @output.write([binstr].pack(@pack_mode))
    end
  end
end