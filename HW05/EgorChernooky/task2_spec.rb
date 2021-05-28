# frozen_string_literal: true

require 'rspec'
require_relative '/home/egor/homeworks-2021/HW03/EgorChernooky/egor_chernooky_hw_03_t_2'

RSpec.describe 'hw_03_t_2' do
  describe '#task2' do
    context 'when logs are empty' do
      let(:empty_string) { '' }

      it 'should return an empty array' do
        expect(task2(empty_string)).to be_empty
      end
    end
    context 'when logs are not empty' do
      context 'when there is no suitable variants in text' do
        let(:empty_array) { [] }
        let(:invalid_log) { '2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>' }

        it 'should return an empty array' do
          expect(task2(invalid_log)).to be_empty
        end
      end

      context 'when there are some suitable variants' do
        let(:logs) do
          <<~LOGS
            10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
            10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
            2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
            10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290
          LOGS
        end
        let(:output_array) do
          [
            '23/Apr/2018:20:30:39 +0300 FROM: 10.6.246.103 TO: /TEST/2/MESSAGES',
            '23/Apr/2018:20:30:42 +0300 FROM: 10.6.246.101 TO: /TEST/2/RUN',
            '23/Apr/2018:20:31:39 +0300 FROM: 10.6.246.101 TO: /TEST/2/MESSAGES'
          ]
        end

        it 'should return an array of formatted strings containing information about post requests' do
          expect(task2(logs)).to eq output_array
        end
      end
    end
  end
end
