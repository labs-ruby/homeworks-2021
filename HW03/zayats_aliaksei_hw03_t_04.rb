def symbol_count(string)
  letters = 0
  digits = 0
  digit_pattern = /[0-9]/
  letter_pattern = /[a-zA-Z]/
  string.split("").each do |symbol|
    if symbol.match(digit_pattern)
      digits += 1
    elsif symbol.to_s.match(letter_pattern)
      puts symbol
      letters += 1
    end
  end
  { 'letters':letters, 'digits':digits }
end
