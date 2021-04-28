def task_4(word)
  letters = word.count('a-zA-Z')
  digits = word.count('0-9')
  puts "letters: #{letters}, digits: #{digits}"
end

task_4('hel2!lo')
task_4('wicked .. !')
