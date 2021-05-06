class Student
  attr_accessor :name, :surname, :notifications

  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @notifications = []
  end

  def to_work!(homework)
    notification = Notification.new(homework: homework)
    mentor.notifications << notification
  end

  def mark_as_read!
    @notifications.clear
  end

  def add_answer!(homework, answer)
    homework.answers << answer
  end

  def to_check!(homework)
    notification = Notification.new(homework: homework)
    mentor.notifications << notification
  end
end