# frozen_string_literal: true

require_relative './hw_03_t_01'

describe 'task_1' do
  let!(:logs) do
    <<~LOGS
      10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] POST /test/2/messages HTTP/1.1 200 48 0.0498
      10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] POST /test/2/run HTTP/1.1 200 - 0.2277
      2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
      10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] POST /test/2/messages HTTP/1.1 200 48 0.0290
    LOGS
  end

  let!(:string_with_error) do
    <<~LOGS
      2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
    LOGS
  end

  let!(:logs_without_errors) do
    <<~LOGS
      10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] POST /test/2/messages HTTP/1.1 200 48 0.0498
      10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] POST /test/2/run HTTP/1.1 200 - 0.2277
      10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] POST /test/2/messages HTTP/1.1 200 48 0.0290
    LOGS
  end

  context 'Finding string with error in logs' do
    it 'should return string with error when we call the task_1 method' do
      expect(task_1(logs)).to eq string_with_error.chomp
    end
  end

  context 'If logs have no lines with errors' do
    it 'should return empty string when we call the task_1 method' do
      expect(task_1(logs_without_errors)).to eq nil
    end
  end
end
