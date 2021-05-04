# frozen_string_literal: true

EXP_FIND = %r{/*.+\bPOST/*.+}.freeze
EXP_DATE = %r{\d{2}/\w{3}/\d{4}(:\d{2}){3}..\d{4}}.freeze
EXP_IP = /\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b/.freeze
EXP_PATH = %r{^/|//|(/[\w-]+)+[\s]}.freeze

def task2(logs)
  return_array = []
  new_line = ''
  if logs.match(EXP_FIND)
    raw_split_log_array = logs.split("\n")
    raw_split_log_array.each do |line|
      next unless line.match(EXP_FIND)

      new_line += line.match(EXP_DATE).to_s + ' FROM: '
      new_line += line.match(EXP_IP).to_s + ' TO: '
      new_line += line.match(EXP_PATH).to_s.upcase
      return_array << new_line
      new_line = ''
    end
    return_array
  else
    return_array
  end
end
