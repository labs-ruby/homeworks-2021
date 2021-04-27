# frozen_string_literal: true

class Mentor
  attr_reader :name, :surname, :notifications, :subscriptions

  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @subscriptions = []
    @notifications = []
  end

  def add_homework(title:, description:, student:)
    homework = Homework.new(title: title, description: description, student: student, mentor: self)
    notification = Notification.new(homework: homework)

    student.homeworks << homework
    student.notifications << notification

    homework
  end

  def subscribe_to!(student)
    subscriptions << student
  end

  def mark_as_read!
    @notifications = []
  end

  def reject_to_work!(homework)
    homework = homework.student.homeworks.find { |hw| hw == homework }
    notification = Notification.new(homework: homework)
    homework.student.notifications << notification
  end

  def accept!(homework)
    notification = Notification.new(homework: homework)
    homework.student.notifications << notification
    homework.student.homeworks.delete(homework)
  end
end
