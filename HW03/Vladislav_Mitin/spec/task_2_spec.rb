require_relative '../vladislav_mitin_hw_03_t_02'

describe 'task2' do
  let(:error_logs) do
    <<~LOGS
      10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
      2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
      10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
      2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
    LOGS
  end

  let(:no_errors_logs) do
    <<~LOGS
      10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
      10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
    LOGS
  end

  let(:invalid_logs) do
    <<~LOGS
      10.6.246.103 - - [23/Apr/202/messages HTTP/1.1" 200 48 0.0498
      10.6.223/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
    LOGS
  end

  let(:valid_logs) do
    [
      '23/Apr/2018:20:30:39 +0300 FROM: 10.6.246.103 TO: /TEST/2/MESSAGES',
      '23/Apr/2018:20:30:42 +0300 FROM: 10.6.246.101 TO: /TEST/2/RUN'
    ]
  end

  context 'when there are errors' do
    it { expect(task2(error_logs)).to eq valid_logs }
  end

  context 'when there are no errors' do
    it { expect(task2(no_errors_logs)).to eq valid_logs }
  end

  context 'when invalid format' do
    it { expect(task2(invalid_logs)).to eq [] }
  end
end
