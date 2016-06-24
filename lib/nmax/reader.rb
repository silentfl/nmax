module Nmax
  # class Reader read input stream and return numbers only
  class Reader
    include Enumerable

    def initialize(stream)
      @stream = stream
    end

    def each
      @stream.read.scan(/\S+/).each do |num|
        next unless num =~ /^\d+$/
        yield num.to_i
      end
    end
  end
end
