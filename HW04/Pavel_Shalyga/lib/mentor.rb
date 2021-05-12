# The Mentor class is used to create objects that can interact with student objects
class Mentor
  attr_writer :name, :surname
  attr_reader :student
  attr_accessor :notification

  def initialize(name, surname)
    @name = name
    @surname = surname
    @notification = Notification.new
  end

  def notifications
    @notification.messages
  end

  def mark_as_read!
    @notification.messages.clear
  end

  def add_homework(title, description)
    homework = Homework.new(title, description)
    @student.homeworks << homework
    @student.notification.add("#{@name} #{@surname}: New homework: #{title}, #{description}")
    homework
  end

  def subscribe_to!(student)
    @student = student
    student.mentor = self
  end

  def reject!(homework)
    homework.reject!
    @student.notification.add("#{@name} #{@surname}: Homework #{homework} rejected")
  end

  def accept!(homework)
    homework.accept!
    @student.notification.add("#{@name} #{@surname}: Homework #{homework} accepted")
  end

  def sent_to(student, message)
    student.notification.add("#{@name} #{@surname}: #{message}")
  end
end
