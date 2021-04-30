HOUR_IN_SEC = 3600
MIN_IN_SEC = 60

logs = "2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event"

def task3(logs)
  sorted_logs = logs.split("\n").select { |line| line.downcase.include?('calling core with action') }
  arr = []
  sorted_logs.each do |line|
    arr << line.split(" ubuntu")
  end
  
  dates = []
  sorted_logs.length.times do |i|
    dates << arr[i][0]
  end
  
  time = []
  dates.each do |date|
    time << date.split.last
  end
  
  def calculate(str)
    arr = str.split(":")
    (arr[0].to_f * HOUR_IN_SEC) + (arr[1].to_f * MIN_IN_SEC) + arr[2].to_f
  end
  
  output = []
  (dates.length-1).times do |i|
    result = calculate(time[i+1]) - calculate(time[i])
    if sorted_logs.length == 2 
      digits = (time[i].split(":").last.split(".").last.length > time[i+1].split(":").last.split(".").last.length ? time[i].split(":").last.split(".").last.length : time[i+1].split(":").last.split(".").last.length)
      output << "(#{dates[i+1]} - #{dates[i]}) = (#{time[i+1]} - #{time[i]}) = #{result.round(digits).to_s}"
    end
    if sorted_logs.length > 2
      output << result.round(digits).to_s
    end
  end
  
  output
end

puts task3(logs)
