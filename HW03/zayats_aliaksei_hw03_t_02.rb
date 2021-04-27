def filter_log(text)
  arr = []
  array_text = text.split("\n")
  array_text.each do |string|
    if string =~ /POST/
      ip = string[/([^\s]+)/]
      timestamp = string[/(?<=\[).*(?=\])/].gsub('\"POST', '').gsub('\]', '')
      path = string[/(?<=POST).*(?=HTTP)/].upcase
      arr << "#{timestamp} FROM: #{ip} TO: #{path}"
    else
      arr << []
    end
  end
  arr
end
