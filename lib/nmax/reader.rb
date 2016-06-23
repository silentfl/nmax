module Nmax
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
