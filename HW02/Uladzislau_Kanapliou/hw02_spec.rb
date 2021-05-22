# frozen_string_literal: true

require 'pry'
require_relative './hw02'

using MyArrayMethods

describe MyArrayMethods do
  describe '.my_each' do
    context 'array is not empty' do
      subject { [1, 2, 3, 4, 5] }

      it 'iterates through array' do
        sum = 0
        subject.my_each { sum += 1 }
        expect(sum).to eq(subject.size)
      end

      it 'passes each element through pipe' do
        result = []
        subject.my_each { |el| result << el }
        expect(result).to eq(subject)
      end

      it 'returns array itself' do
        expect(subject.my_each {}).to eq(subject)
      end

      it 'returns array itself if block not given' do
        expect(subject.my_each).to eq(subject)
      end

      it 'raise exception when block contains exception' do
        expect {subject.my_each { raise StandardError }}.to raise_error (StandardError)
      end
    end
  end
end
