# The Student class is used to create objects that can interact with mentor objects
class Student
  attr_writer :name, :surname
  attr_accessor :notification, :homeworks, :mentor

  def initialize(name, surname)
    @name = name
    @surname = surname
    @notification = Notification.new
    @homeworks = []
  end

  def notifications
    @notification.messages
  end

  def mark_as_read!
    @notification.messages.clear
  end

  def homework
    @homeworks.last
  end

  def to_work!(homework)
    @mentor.notification.add("#{@name} #{@surname}: I'm working with #{homework}")
    index = @homeworks.index(homework)
    @homeworks[index].working!
  end

  def to_check!(homework)
    @mentor.notification.add("#{@name} #{@surname}: My homework: #{homework}")
  end

  def sent_to(mentor, message)
    mentor.notification.add("#{@name} #{@surname}: #{message}")
  end
end
