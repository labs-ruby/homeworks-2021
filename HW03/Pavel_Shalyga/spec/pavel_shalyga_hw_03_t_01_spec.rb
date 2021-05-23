require 'rspec'
require_relative '../pavel_shalyga_hw_03_t_01'

RSpec.describe 'Task 1' do
  let(:empty_log) { '' }

  let(:logs_without_errors) do
    <<~LOGS
      10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0498
      10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /grid/2/event HTTP/1.1" 200 - 0.2277
      10.6.246.101 - - [23/Apr/2018:20:29:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0290
    LOGS
  end

  let(:logs_with_one_error) do
    <<~LOGS
      10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0498
      10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /grid/2/event HTTP/1.1" 200 - 0.2277
      2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
      10.6.246.101 - - [23/Apr/2018:20:29:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0290
    LOGS
  end

  let(:logs_with_errors) do
    <<~LOGS
      10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0498
      10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /grid/2/event HTTP/1.1" 200 - 0.2277
      2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
      2020-07-14 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
      10.6.246.101 - - [23/Apr/2018:20:29:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0290
    LOGS
  end

  describe '#task1 method' do
    context 'when logs contain one error' do
      it 'return full text of the line with an error' do
        expect(task1(logs_with_one_error)).to eq('2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>')
      end
    end

    context 'when logs contain few errors' do
      it 'return full text of the first line with an error' do
        expect(task1(logs_with_errors)).to eq('2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>')
      end
    end

    context 'when logs contain no errors' do
      it 'return an empty string' do
        expect(task1(logs_without_errors)).to eq('')
      end
    end

    context 'when there are no logs' do
      it 'return an empty string' do
        expect(task1(empty_log)).to eq('')
      end
    end
  end
end
