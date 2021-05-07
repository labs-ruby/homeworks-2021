class Student
  attr_reader :name, :surname, :notifications, :homeworks

  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @notifications = []
    @homeworks = []
  end

  def attach_mentor(mentor)
    @mentor = mentor
  end

  def push_notification(notification)
    @notifications << notification
  end

  def to_work!(homework)
    notification = Notification.new(homework: homework, status: 'work started')
    @homeworks << homework
    @mentor.push_notification(notification)
  end

  def mark_as_read!
    @notifications.clear
  end

  def add_answer!(homework, answer)
    homework.add_answer!(answer)
  end

  def to_check!(homework)
    notification = Notification.new(homework: homework, status: 'homework has been sent to review')
    @mentor.push_notification(notification)
  end
end
