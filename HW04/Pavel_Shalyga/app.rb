require_relative 'lib/student'
require_relative 'lib/mentor'
require_relative 'lib/homework'
require_relative 'lib/notification'

student = Student.new('Pavel', 'Shalyga')
mentor = Mentor.new('Jack', 'Gonsales')

# mentor subscribe to student
mentor.subscribe_to!(student)

# mentor add new homework
homework = mentor.add_homework('HW03', 'description homework')

# student see notification about new homework
puts student.notifications
# student mark as read all notifications
student.mark_as_read!

# student take to work homework
p student.homeworks
student.to_work!(homework)
p student.homeworks

# mentor see notification about homework to work
puts mentor.notifications
# mentor mark as read all notifications
mentor.mark_as_read!

# student sent to check homework
student.to_check!(homework)

# mentor see notification about homework to check
puts mentor.notifications
mentor.mark_as_read!
# mentor reject homework
mentor.reject!(homework)

# student see notification about homework was reject
puts student.notifications
student.mark_as_read!
student.to_check!(homework)

puts mentor.notifications
mentor.mark_as_read!
# mentor accept homework
mentor.accept!(homework)

# student see notification about homework was accept
puts student.notifications
student.mark_as_read!

# simple dialog between student and mentor
student.sent_to(mentor, 'Test message')
puts mentor.notifications
mentor.mark_as_read!

mentor.sent_to(student, 'Test answer')
puts student.notifications
student.mark_as_read!

student.sent_to(mentor, 'Thanks')
puts mentor.notifications
mentor.mark_as_read!
