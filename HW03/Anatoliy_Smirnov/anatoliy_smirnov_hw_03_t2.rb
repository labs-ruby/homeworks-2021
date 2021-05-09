IP_FORMAT = /\b(?:[0-9]{1,3}\.){3}[0-9]{1,3}\b/.freeze
DATETIME_FORMAT = /\[(.*?)\]/.freeze
TO_FORMAT= /POST (.*) HTTP/

def task2(logs)
  result = []
  lines = logs.split("\n")
  lines.each do |string| 
    next if string.include?('error')  
    date = string.scan(DATETIME_FORMAT).first
    ip = string.scan(IP_FORMAT)
    to = string.scan(TO_FORMAT).first
    if date != nil
      result << "DATE: #{date} IP: #{ip} TO: #{to}"
   end
  end 
  result
end