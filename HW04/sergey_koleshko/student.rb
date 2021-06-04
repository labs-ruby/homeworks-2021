require_relative 'notification'

class Student
  attr_reader :name, :surname, :notifications, :homeworks, :mentors

  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @notifications = []
    @homeworks = []
    @mentors = []
  end

  def add_notification(message)
    notifications << Notification.new(name, surname, message)
  end

  def notify(mentor, message)
    mentor.add_notification(message)
  end

  def mark_as_read!
    notifications.clear
  end

  def add_mentor(mentor)
    @mentors << mentor
  end
end
