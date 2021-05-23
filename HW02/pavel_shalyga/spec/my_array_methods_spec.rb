require 'rspec'
require_relative '../my_array_methods'

using MyArrayMethods

RSpec.describe 'MyArrayMethods' do
  let(:test_array) { [1, 2, 3, 4, 5] }

  describe '#my_each' do
    context 'when block is given' do
      it 'return initial array' do
        expect(test_array.my_each {}).to eq(test_array)
      end
    end

    context 'when block is not given' do
      it 'return initial array' do
        expect(test_array.my_each).to eq(test_array)
      end
    end
  end

  describe '#my_select' do
    context 'when block is given' do
      it 'return a new array containing all elements of initial array for which the given block returns a true value' do
        expect(test_array.my_select(&:even?)).to eq([2, 4])
      end
    end

    context 'when block is not given' do
      it 'return initial array' do
        expect(test_array.my_select).to eq(test_array)
      end
    end
  end

  describe '#my_map' do
    context 'when block is given' do
      it 'return a new array containing the values returned by the block' do
        expect(test_array.my_map { |x| x + 1 }).to eq(test_array.map { |x| x + 1 })
      end
    end

    context 'when block is not given' do
      it 'return initial array' do
        expect(test_array.my_map).to eq(test_array)
      end
    end
  end
end
