DATETIME = /^\d{4}-\d{2}-\d{2}\ \d{2}:\d{2}:\d{2}\.\d{1}/

def task3(logs)
  date_array = []
  log_list = logs.split("\n").select { |line| line.include?('action') }
  log_list.each do |log_line|
    date_array << log_line.scan(DATETIME).join
  end

  result = []
  (date_array.length - 1).times do |i|
 
     date_array.length >= 2 ?
      (cur_log_line = date_array[i].scan(DATETIME).join
      next_log_line = date_array[i + 1].scan(DATETIME).join
      result << (Time.parse(next_log_line) - Time.parse(cur_log_line)).to_s)
      :
      (cur_log_line = date_array[i].scan(DATETIME).join
      next_log_line = date_array[i + 1].scan(DATETIME).join
      result << "#{next_log_line} - #{cur_log_line} = #{Time.parse(next_log_line) - Time.parse(cur_log_line)}")
  end
  result
end
