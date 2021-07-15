require 'rspec'
require_relative '../pavel_shalyga_hw_03_t_03'

RSpec.describe 'Task 3' do
  let(:empty_log) { '' }

  let(:logs_with_one_string) do
    <<~LOGS
      2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
    LOGS
  end

  let(:wrong_logs) do
    <<~LOGS
      ubuntu-xenial[14319] Debug - Calling core 2018-04-23 17:17:49.7 with action: event 
      2018-04-23 17:17:49.7  -  action: event ubuntu-xenial[14319] Debug
      2018-04-23 17:17:49.7 Debug - Calling core with ubuntu-xenial[14319] action: event
    LOGS
  end

  let(:logs_with_two_callings) do
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

  let(:logs_with_three_callings) do
    <<~LOGS
      2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
      2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
      2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
      2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
      2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
      2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
      2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
      2018-04-23 17:19:38.5 ubuntu-xenial[14319] Debug - Calling core with action: messages
    LOGS
  end

  describe '#task3 method' do
    context 'when there are no logs' do
      it 'return 0' do
        expect(task3(empty_log)).to eq('0')
      end
    end

    context 'when there are one string in logs' do
      it 'return 0' do
        expect(task3(logs_with_one_string)).to eq('0')
      end
    end

    context 'when logs contain incorrect strings' do
      it 'return 0' do
        expect(task3(wrong_logs)).to eq('0')
      end
    end

    context 'when logs contain two callings' do
      it 'return string containing the duration of the action in seconds between events that occurred at the time of Calling core with action' do
        expect(task3(logs_with_two_callings)).to eq(['49.1'])
      end
    end

    context 'when logs contain more than two callings' do
      it 'return an array of duration' do
        expect(task3(logs_with_three_callings)).to eq(%w[49.1 59.7])
      end
    end
  end
end
