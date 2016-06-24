require 'spec_helper'

describe Nmax::Reader do
  let(:numbers) do
    Nmax::Reader.new(StringIO.new('1 2 3 4 5 6 7 8 9 10'))
  end

  it 'is iterable' do
    expect(numbers.respond_to? :each).to eq(true)
  end

  it 'test input' do
    [
      { test: '', ans: [] },
      { test: '1', ans: [1] },
      { test: '1 2', ans: [1, 2] },
      { test: '1 2a b3 4 c5d', ans: [1, 4] },
      { test: 'a b c d e f', ans: [] },
      { test: 'a1 b2 c3 d4 e5', ans: [] },
      { test: '12345', ans: [12345] },
      { test: "1#{'0' * 1000} " * 100, ans: [10**1000] * 100 },
    ].each do |item|
      nums = Nmax::Reader.new(StringIO.new(item[:test]))
      ans = []
      nums.each { |num| ans << num }
      expect(ans).to match_array(item[:ans])
    end
  end
end
