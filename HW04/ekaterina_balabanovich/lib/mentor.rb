# frozen_string_literal: true

class Mentor
  attr_reader :name, :surname, :students, :notifications

  def initialize(name, surname)
    @name = name
    @surname = surname
    @students = []
    @notifications = []
  end

  def add_homework(title:, description:, student:)
    Homework.new(title, description, student, self)
  end

  def get_notification(notification)
    @notifications << notification
  end

  def mark_as_read!
    @notifications.clear
  end

  def reject_to_work!(homework)
    homework.transition_to(WorkStateRejected.new)
  end

  def accept!(homework)
    homework.transition_to(WorkStateAccepted.new)
  end
end
