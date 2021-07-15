require 'rspec'
require_relative '../pavel_shalyga_hw_03_t_02'

RSpec.describe 'Task 2' do
  let(:empty_log) { '' }

  let(:logs_without_post_requests) do
    <<~LOGS
      2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
    LOGS
  end

  let(:logs_with_post_requests) do
    <<~LOGS
      10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
      10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
      10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290
    LOGS
  end

  let(:logs_with_post_requests_and_errors) do
    <<~LOGS
      10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
      10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
      2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
      10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290
    LOGS
  end

  let(:wrong_logs) do
    <<~LOGS
      [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498 10.6.246.101 - -
      10.6.246.101 - - [23/Apr/2018:20:30:42 +03 200 - 0.2277
      2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
      10.6.246.101 - - "POST /test/2/messages HTTP/1.1" 200 48 0.0290
    LOGS
  end

  describe '#task2 method' do
    context 'when logs contain errors' do
      it 'return an array of formatted strings containing information about post requests' do
        expect(task2(logs_with_post_requests_and_errors)).to eq([
                                                                    '23/Apr/2018:20:30:39 +0300 FROM: 10.6.246.103 TO: /TEST/2/MESSAGES',
                                                                    '23/Apr/2018:20:30:42 +0300 FROM: 10.6.246.101 TO: /TEST/2/RUN',
                                                                    '23/Apr/2018:20:31:39 +0300 FROM: 10.6.246.101 TO: /TEST/2/MESSAGES'
                                                                ])
      end
    end

    context 'when logs contain no errors' do
      it 'return an array of formatted strings containing information about post requests' do
        expect(task2(logs_with_post_requests)).to eq([
                                                                    '23/Apr/2018:20:30:39 +0300 FROM: 10.6.246.103 TO: /TEST/2/MESSAGES',
                                                                    '23/Apr/2018:20:30:42 +0300 FROM: 10.6.246.101 TO: /TEST/2/RUN',
                                                                    '23/Apr/2018:20:31:39 +0300 FROM: 10.6.246.101 TO: /TEST/2/MESSAGES'
                                                                ])
      end
    end

    context 'when there are no logs' do
      it 'return an empty array' do
        expect(task2(empty_log)).to eq([])
      end
    end

    context 'when there are no matching strings in the logs' do
      it 'return an empty array' do
        expect(task2(logs_without_post_requests)).to eq([])
      end
    end

    context 'when logs contain incorrect strings' do
      it 'return an empty array' do
        expect(task2(wrong_logs)).to eq([])
      end
    end
  end
end
