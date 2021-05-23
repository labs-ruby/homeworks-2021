# frozen_string_literal: true

require 'rspec'
require_relative '/home/egor/homeworks-2021/HW03/EgorChernooky/egor_chernooky_hw_03_t_4'

RSpec.describe 'hw_03_t_4' do
  let(:str) { 'hel2!lo' }
  let(:result) { { letters: 5, digits: 1 } }
  
  describe '#task4' do
    it 'should return the number of letters and digits' do
      expect(task4(str)).to eq result
    end
  end
end
