require 'date'

def task3(logs)
  exp_find = %r{/*.+\bCalling core/*.+}

  return_array = []
  datetimes = []

  if logs.match(exp_find)
    raw_split_log_array = logs.split("\n")
    raw_split_log_array.each do |line|
      next unless line.match(exp_find)

      datetime = DateTime.parse(line)
      datetimes << datetime
    end

    if datetimes.size == 1
      '0'
    elsif datetimes.size == 2
      ((datetimes[1].strftime('%Q').to_i -
        datetimes[0].strftime('%Q').to_i).to_s[0...-2].to_f / 10).to_s
    else
      (0...datetimes.size - 1).each do |i|
        return_array << ((datetimes[i + 1].strftime('%Q').to_i -
                    datetimes[i].strftime('%Q').to_i).to_s[0...-2].to_f / 10).to_s
      end
      return_array
    end
  else
    '0'
  end
end
