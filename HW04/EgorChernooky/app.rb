require_relative 'lib/Homework'
require_relative 'lib/Mentor'
require_relative 'lib/Student'
require_relative 'lib/Notification'

mentor = Mentor.new(name: 'Jack', surname: 'Gonsales')
student = Student.new(name: 'John', surname: 'Doe', mentor: mentor)

homework = mentor.add_homework(title: 'HW01',
                              description: 'Array methods implementation',
                              student: student,
                              mentor: mentor
)

mentor.notify_student

p student.notifications
student.mark_as_read!
p student.notifications

p student.homeworks
student.to_work!
student.to_check!
p student.homeworks

p mentor.notifications
mentor.mark_as_read!
p mentor.notifications

p mentor.approve_hw

p student.notifications
student.mark_as_read!