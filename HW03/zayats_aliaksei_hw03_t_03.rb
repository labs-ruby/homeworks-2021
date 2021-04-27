require 'time'

def collect_core_timestamp(text)
  array_time = []
  text.split("\n").each { |string| array_time << string[/([^ubuntu]+)/] if string =~ /Calling/ }
  array_time.size <= 1 ? 0 : array_time
end

def diff_timestamp(array_time)
  count = array_time.size - 1
  time_diff = []
  pattern = "%Y-%m-%d %H:%M:%S.%L"
  index = -1
  count.times do
    time_diff << Time.strptime(array_time[index], pattern) - Time.strptime(array_time[index - 1], pattern)
    index -= 1
  end
  time_diff.reverse
end

puts diff_timestamp(collect_core_timestamp(text))
