# frozen_string_literal: true

class Student
  attr_reader :name, :surname, :homeworks, :notifications

  def initialize(name, surname)
    @name = name
    @surname = surname
    @homeworks = []
    @notifications = []
  end

  def mark_as_read!
    @notifications.clear
  end

  def to_work!; end

  def add_answer!(homework, answer); end

  def to_check!(homework); end

  def get_homework(homework)
    @homeworks << homework
  end

  def get_notifications(notification)
    @notifications << notification
  end
end
