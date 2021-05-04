# frozen_string_literal: true

EXP_FIND = %r{/*.+\bPOST/*.+}.freeze
EXP_DATE = %r{\d{2}/\w{3}/\d{4}(:\d{2}){3}..\d{4}}.freeze
EXP_IP = /\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b/.freeze
EXP_PATH = %r{^/|//|(/[\w-]+)+[\s]}.freeze

logs = '10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290'

def task2(logs)
  return_array = []
  new_line = ''
  if logs.match(EXP_FIND)
    raw_split_log_array = logs.split("\n")

    return_array = raw_split_log_array.select { |line| line.match(EXP_FIND) }

    return_array.map.with_index do |line, i|
      new_line += line.match(EXP_DATE).to_s + ' FROM: '
      new_line += line.match(EXP_IP).to_s + ' TO: '
      new_line += line.match(EXP_PATH).to_s.upcase
      return_array[i] = new_line

      new_line = ''
    end
    return_array

  else
    return_array
  end
end

p task2(logs)
