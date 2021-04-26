# frozen_string_literal: true

def task4(data)
  data = data.strip
  h = {}

  h[:letters] = data.count('a-zA-Z')
  h[:digits] = data.count('0-9')

  h
end
