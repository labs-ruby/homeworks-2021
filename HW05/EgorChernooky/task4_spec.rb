# frozen_string_literal: true

require 'rspec'
require_relative '/home/egor/homeworks-2021/HW03/EgorChernooky/egor_chernooky_hw_03_t_4'

RSpec.describe 'hw_03_t_4' do
  
  describe '#task4' do
    context 'when string is not empty' do
      let(:str) { 'hel2!lo' }
      let(:result) { { letters: 5, digits: 1 } }
      
      it 'should return the number of letters and digits' do
        expect(task4(str)).to eq result
      end
    
    context 'when string is empty' do
      let(:empty_string) { '' }
      let(:default_hash) { { letters: 0, digits: 0 } }
      
      it 'should return 0 for letters and digits' do
        expect(task4(empty_string).to eq default_hash
      end
    end
  end
end
