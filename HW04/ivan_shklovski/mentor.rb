class Mentor
  attr_reader :name, :surname, :notifications, :students

  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @notifications = []
    @students = []
  end

  def new_homework(homework)
    notification = Notification.new(homework: homework, status: 'new homework')
    @students.each { |student| student.push_notification(notification) }
  end

  def mark_as_read!
    @notifications = []
  end

  def subscribe_to!(student)
    @students << student
  end

  def push_notification(notification)
    @notifications << notification
  end

  def reject_to_work!(homework)
    notification = Notification.new(homework: homework, status: 'homework rejected')
    homework.student.push_notification(notification)
  end

  def accept!(homework)
    notification = Notification.new(homework: homework, status: 'homework accepted')
    homework.student.push_notification(notification)
  end
end
