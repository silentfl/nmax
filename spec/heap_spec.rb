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

  context 'examples' do
    let(:res) { (1..10).to_a.reverse.join(' ') }

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

    it 'odd example' do
      heap = Nmax::Heap.new(9)
      (1..11).each { |i| heap << i }
      expect(heap.to_s).to eq((3..11).to_a.reverse.join(' '))
    end

    it 'equal example' do
      heap = Nmax::Heap.new(10)
      items = (1..100).map { rand(1..10) }
      items.each { |i| heap << i }
      expect(heap.to_s).to eq(items.sort.reverse.take(10).join(' '))
    end
  end

  context 'extended examples' do
    context 'uniq' do
      let(:res) { (1..10).to_a.reverse.join(' ') }

      it 'simple' do
        heap = Nmax::Heap.new(10, uniq: true)
        (1..10).each { |i| heap << i }
        expect(heap.to_s).to eq(res)
      end

      it 'double' do
        heap = Nmax::Heap.new(10, uniq: true)
        ((1..10).to_a * 2).shuffle.each { |i| heap << i }
        expect(heap.to_s).to eq(res)
      end

      it 'only one' do
        heap = Nmax::Heap.new(10, uniq: true)
        (1..10).each { heap << 1 }
        expect(heap.to_s).to eq('1')
      end
    end

    context 'keep_order' do
      it 'simple' do
        heap = Nmax::Heap.new(10, keep_order: true)
        (1..10).each { |i| heap << i }
        expect(heap.to_s).to eq((1..10).to_a.join(' '))
      end

      it 'random' do
        heap = Nmax::Heap.new(10, keep_order: true)
        items = (1..10).to_a.shuffle
        items.each { |i| heap << i }
        expect(heap.to_s).to eq(items.join(' '))
      end
    end
  end
end
