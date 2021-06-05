def task4(str)
  str_counter = {}
  str_counter[:letters] = str.count('A-Za-z')
  str_counter[:digits] = str.count('0-9')
  str_counter
end