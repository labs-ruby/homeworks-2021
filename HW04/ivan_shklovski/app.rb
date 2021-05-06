require_relative 'D:/Projects/EPAM/homeworks-2021/HW04/ivan_shklovski/student'
require_relative 'D:/Projects/EPAM/homeworks-2021/HW04/ivan_shklovski/mentor'
require_relative 'D:/Projects/EPAM/homeworks-2021/HW04/ivan_shklovski/homework'
require_relative 'D:/Projects/EPAM/homeworks-2021/HW04/ivan_shklovski/notification'

class App
    attr_accessor :student, :mentor, :homework

student = Student.new(name: 'John', surname: 'Doe')
mentor = Mentor.new(name: 'Jane', surname: 'Doe')

homework = Homework.new(title: 'HW04', description: 'Homework')

puts 'Mentor add new homework'
mentor.new_homework(homework)

puts 'Student see notification about new homework'
puts student.notifications

puts 'Student mark as read all notifications'
student.mark_as_read!

puts 'Notifications after reading them by student'
puts student.notifications

puts 'Mentor subscribe to student'
mentor.subscribe_to!(student)

puts 'Student take to work homework'
student.to_work!(homework)
puts student.homeworks

puts 'Mentor see notification about homework to work'
puts mentor.notifications

puts 'Mentor mark as read all notifications'
mentor.mark_as_read!

puts 'Notifications after reading them by mentor'
puts mentor.notifications

puts 'Student add answer to homework'
student.add_answer!(homework, 'add answer')

puts 'Student sent to check homework'
student.to_check!(homework)

puts 'Mentor see notification about homework to check'
puts mentor.notifications

puts 'Mentor reject homework'
mentor.reject_to_work!(homework)

puts 'Student see notification about homework was reject'
puts student.notifications

puts 'Student add answer to homework'
student.add_answer!(homework, 'add new answer')

puts 'Student sent to check homework with fixed bugs'
student.to_check!(homework)

puts 'Mentor see notification about fixed homework'
puts mentor.notifications

puts 'Mentor accept homework'
mentor.accept!(homework)

puts 'Student see notification about homework was accept'
puts student.notifications

end
