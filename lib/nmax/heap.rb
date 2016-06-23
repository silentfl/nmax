module Nmax
  class Heap
    def initialize(count, params = {})
      raise ArgumentError, 'Count of maximum must be less or equal 1' if count < 1
      @count = count
      @data = []
      @index = 0
      @uniq = params[:uniq] && params[:uniq] == true ? true : false
      @keep_order = params[:keep_order] && params[:keep_order] == true ? true : false
    end

    def to_s
      if @keep_order
        @data.sort { |x, y| x[:index] <=> y[:index] }
      else
        @data
      end
        .map { |i| i[:value] }
        .join(' ')
    end

    def insert(value)
      return if @data.size == @count &&
                @data.last[:value] > value

      index = bin_search_index(value)
      return if index == @count ||
                @uniq && @data[index] && @data[index][:value] == value

      @data
        .insert(index, value: value, index: @index)
        .delete_at(@count)

      @index += 1
    end

    private

    # binary search for decreasing @data
    def bin_search_index(value)
      left, right = 0, @data.size - 1
      while left <= right
        mid = (left + right) >> 1
        case value <=> @data[mid][:value]
        when -1 then left = mid + 1
        when 1 then right = mid - 1
        else return mid
        end
      end
      left
    end
  end
end
