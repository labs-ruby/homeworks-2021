# frozen_string_literal: true

require 'rspec'
require_relative '/home/egor/homeworks-2021/HW03/EgorChernooky/egor_chernooky_hw_03_t_3'

RSpec.describe 'hw_03_t_3' do
  describe '#task3' do
    context 'when there is no logs' do
      let(:empty_string) { '' }

      it 'should return 0' do
        expect(task3(empty_string)).to be_zero
      end
    end

    context 'when there is only 1 suitable variant' do
      let(:one_line_text) do
        '2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event'
      end
      let(:empty_string) { '' }

      it 'should return 0' do
        expect(task3(one_line_text)).to be_zero
      end
    end

    context 'when there are 2 suitable variants' do
      let(:logs) do
        <<~LOGS
          2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
          2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
          2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
          2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
          2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
          2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
          2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
        LOGS
      end
      let(:expression) { ['2018-04-23 17:18:38.8 - 2018-04-23 17:17:49.7 = 49.1'] }

      it 'should return an expression with the result of it' do
        expect(task3(logs)).to eq expression
      end
    end

    context 'when there are 3 or more suitable variants' do
      let(:three_suit_lines) do
        <<~LOGS
          2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
          2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
          2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
          2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
          2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
          2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
          2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
          2018-04-23 17:19:10.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
        LOGS
      end
      let(:numbers) { %w[49.1 32.0] }

      it 'should return array of numbers in string format' do
        expect(task3(three_suit_lines)).to eq numbers
      end
    end
  end
end
