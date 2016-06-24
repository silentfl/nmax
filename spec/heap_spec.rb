require 'spec_helper'

describe Nmax::Heap do
  context 'init' do
    it 'raise' do
      expect { Nmax::Heap.new(-1) }.to raise_error(ArgumentError)
      expect { Nmax::Heap.new(0) }.to raise_error(ArgumentError)
    end

    it 'ok' do
      expect { Nmax::Heap.new(1) }.not_to raise_error
    end
  end

  context 'to_s' do
    let (:res) { (1..10).to_a.reverse.join(' ') }
    it 'simple' do
      heap = Nmax::Heap.new(10)
      (1..10).each { |i| heap << i }
      expect(heap.to_s).to eq(res)
    end

    it 'reverse' do
      heap = Nmax::Heap.new(10)
      10.downto(1).each { |i| heap << i }
      expect(heap.to_s).to eq(res)
    end

    it 'random' do
      heap = Nmax::Heap.new(10)
      (1..10).to_a.shuffle.each { |i| heap << i }
      expect(heap.to_s).to eq(res)
    end

    it 'keep order' do
      heap = Nmax::Heap.new(10, keep_order: true)
      items = (1..10).to_a.shuffle
      items.each { |i| heap << i }
      expect(heap.to_s).to eq(items.join(' '))
    end
  end
end
