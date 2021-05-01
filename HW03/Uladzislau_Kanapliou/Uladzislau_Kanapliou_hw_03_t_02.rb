def task2(logs)
  exp_find = %r{/*.+\bPOST/*.+}
  exp_date = %r{\d{2}/\w{3}/\d{4}(:\d{2}){3}..\d{4}}
  exp_ip = /\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b/
  exp_path = %r{^/|//|(/[\w-]+)+[\s]}
  return_array = []
  new_line = ''
  if logs.match(exp_find)
    raw_split_log_array = logs.split("\n")
    raw_split_log_array.each do |line|
      next unless line.match(exp_find)

      new_line += line.match(exp_date).to_s + ' FROM: '
      new_line += line.match(exp_ip).to_s + ' TO: '
      new_line += line.match(exp_path).to_s.upcase
      return_array << new_line
      new_line = ''
    end
    return_array
  else
    return_array
  end
end
