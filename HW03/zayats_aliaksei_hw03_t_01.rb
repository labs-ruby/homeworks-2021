def find_error_in_text(text)
  array_text = text.split("\n")
  array_text.each do |string|
    puts string if string =~ /[Ee]rror/
  end
end
