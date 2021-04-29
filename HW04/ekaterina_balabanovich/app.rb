require_relative 'lib/student'
require_relative 'lib/mentor'
require_relative 'lib/homework'
require_relative 'lib/notification'

mentor = Mentor.new('Ivan', 'Stepanov')
student = Student.new('Arina', 'Vesyolkova')

homework = mentor.add_homework(title: 'HW01', description: 'Do something', student: student)

puts 'Student\'s notifications:'
puts student.notifications
student.mark_as_read!

puts 'Homeworks that student has:'
student.homeworks.each { |a| puts a.title }

student.add_answer!(homework, 'solving')
student.to_check!(homework)

puts 'Mentor\'s notifications'
puts mentor.notifications
mentor.mark_as_read!

new_homework = mentor.add_homework(title: 'HW02', description: 'Do something else', student: student)

puts 'Student\'s notifications:'
puts student.notifications
student.mark_as_read!

puts 'Homeworks before homework rejecting:'
student.homeworks.each { |a| puts a.title }

puts 'Mentor rejected homework'
mentor.reject_to_work!(new_homework)

puts 'Student\'s notifications:'
puts student.notifications
student.mark_as_read!

puts 'Homeworks after homework rejecting:'
student.homeworks.each { |a| puts a.title }

puts 'Mentor accepted homework'
mentor.accept!(new_homework)

puts 'Student\'s notifications:'
puts student.notifications

puts 'Homeworks after homework accepting:'
student.homeworks.each { |a| puts a.title }
