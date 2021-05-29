# frozen_string_literal: true

require 'rspec'
require_relative '/home/egor/homeworks-2021/HW02/EgorChernooky/ArrayMethods'

using ArrayMethods

RSpec.describe ArrayMethods do
  let(:array) { [1, 2, 3, 4, 5] }
  let(:empty_array) { [] }

  describe '#my_each' do
    context 'when array is empty' do
      it 'should return an empty array' do
        expect(empty_array.my_each { |item| p item }).to be_empty
      end
    end

    context 'when array is not empty' do
      it 'returns an origin array' do
        expect(array.my_each { |item| p item }).to eq array
      end
    end
  end

  describe '#my_map' do
    context 'when array is empty' do
      it 'should return an empty array'  do
        expect(empty_array.my_map { |item| item**2 }).to be_empty
      end
    end

    context 'when array is not empty' do
      let(:mapped_array) { [1, 4, 9, 16, 25] }
      
      it 'returns new array' do
        expect(array.my_map { |item| item**2 }).to eq mapped_array
        expect(array).not_to eq mapped_array
      end
    end
  end

  describe '#my_map!' do
    context 'when array is empty' do
      it 'should return an empty array' do
        expect(empty_array.my_map! { |item| item**2 }).to be_empty
      end
    end

    context 'when array is not empty' do
      let(:mapped_array) { [1, 4, 9, 16, 25] }
      
      it 'should return a changed origin array' do
        expect(array.my_map! { |item| item**2 }).to eq mapped_array
        expect(array).to eq mapped_array
      end
    end
  end

  describe '#my_select' do
    context 'when array is empty' do
      it 'should return an empty array' do
        expect(empty_array.my_select { |item| item > 2 }).to be_empty
      end
    end

    context 'when array is not empty' do
      let(:selected_arr) { [3, 4, 5] }
      
      it 'should return a new array and not change the origin one' do
        expect(array.my_select { |item| item > 2 }).to eq selected_arr
        expect(array).not_to eq selected_arr
      end
    end
  end

  describe '#my_empty?' do
    context 'when array is empty' do
      it 'should return true' do
        expect(empty_array.my_empty?).to eq true
      end
    end

    context 'when array is not empty' do
      it 'should return false' do
        expect(array.my_empty?).to eq false
      end
    end
  end

  describe '#my_reverse' do
    context 'when array is empty' do
      it 'should return an empty array' do
        expect(empty_array.my_reverse).to be_empty
      end
    end

    context 'when array is not empty' do
      let(:reversed_array) { [5, 4, 3, 2, 1] }
      
      it 'should return a reversed array without changing the origin one' do
        expect(array.my_reverse).to eq reversed_array
        expect(array).not_to eq reversed_array
      end
    end
  end

  describe '#my_reverse!' do
    context 'when array is empty' do
      it 'should return an empty array' do
        expect(empty_array.my_reverse!).to be_empty
      end
    end

    context 'when array is not empty' do
      let(:reversed_array) { [5, 4, 3, 2, 1] }
      
      it 'should return a reversed origin array' do
        expect(array.my_reverse!).to eq reversed_array
        expect(array).to eq reversed_array
      end
    end
  end
end
