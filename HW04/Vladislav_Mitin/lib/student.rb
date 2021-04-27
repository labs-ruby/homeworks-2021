# frozen_string_literal: true

class Student
  attr_reader :name, :surname, :homeworks, :notifications

  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @homeworks = []
    @notifications = []
  end

  def mark_as_read!
    @notifications = []
  end

  def to_work!(homework)
    notification = Notification.new(homework: homework)
    homework.mentor.notifications << notification
  end

  def add_answer!(homework, answer)
    homework = @homeworks.find { |hw| hw == homework }
    homework.answers << answer
  end

  def to_check!(homework)
    notification = Notification.new(homework: homework)
    homework.mentor.notifications << notification
  end
end
