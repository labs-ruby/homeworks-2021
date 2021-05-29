# frozen_string_literal: true

require_relative '/home/egor/homeworks-2021/HW03/EgorChernooky/egor_chernooky_hw_03_t_1'
require 'rspec'

RSpec.describe 'hw_03_t_1' do
  describe '#task1' do
    context 'when logs are empty' do
      let(:empty_string) { '' }
      
      it 'should return an empty string' do
        expect(task1(empty_string)).to be_empty
      end
    end

    context 'when logs are not empty' do
      let(:logs) do
        <<~LOGS
        10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0498
        10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /grid/2/event HTTP/1.1" 200 - 0.2277
        2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
        10.6.246.101 - - [23/Apr/2018:20:29:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0290
        LOGS
      end
      let(:expected_results) do
        '2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>'
      end
      
      it 'should return logs that include the word "error"' do
        expect(task1(logs)).to eq expected_results
      end
    end
  end
end
