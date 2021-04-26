# frozen_string_literal: true

def task2(logs)
  lines = logs.split("\n")
  lines.map.with_object([]) do |line, arr|
    date = line.scan(/(?<=\[)[^]]+(?=\])/).first
    next if date.nil?

    from = line.scan(/^(?:[0-9]{1,3}\.){3}[0-9]{1,3}/).first
    to = line.scan(/(?<=")[^]]+(?=")/).first.split[0..1].join(' ').upcase

    arr << "#{date} FROM: #{from} TO: #{to}"
  end
end
