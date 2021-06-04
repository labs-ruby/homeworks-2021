require_relative 'mentor'
require_relative 'student.rb'

student = Student.new(name: 'John', surname: 'Doe')
mentor = Mentor.new(name: 'Jack', surname: 'Gonsales')

homework = mentor.add_homework(title: 'HW03', description: 'description homework', student: student)

# student check notifications
student.notifications
# student mark of read notifications
student.mark_as_read!
# notifications is clear
student.notifications
# mentor subscribe to student
mentor.subscribe_to!(student)

student.homeworks