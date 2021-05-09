def task1(log)
  lines = log.split("\n")
  lines.each { |line| return line if line.include?('error') }
  nil
end
