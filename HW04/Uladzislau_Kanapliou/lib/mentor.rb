# frozen_string_literal: true

require_relative 'homework'

class Mentor
  attr_reader :name, :surname, :notifications
  def initialize(name, surname)
    @name = name
    @surname = surname
    @notifications = []
  end

  def add_homework(title, description, student)
    new_homework = Homework.new(title, description, student)
    student.homeworks << new_homework
    notify(student, "#{@name} #{@surname} added #{title} to You")
    new_homework
  end

  def subscribe_to!(student)
    student.attach_mentor(self)
    notify(student, "#{@name} #{@surname} subscribed to You")
  end

  def mark_as_read!
    case @notifications.size
    when 0
      p 'All notifications have been read'
    else
      notifications.clear
    end
  end

  def reject_to_work!(homework)
    homework.state[:done] = false
    homework.state[:in_progress] = true
    notify(homework.student, "#{@name} #{@surname} rejected Your #{homework.title} answer")
  end

  def accept!(homework)
    homework.state[:done] = false
    homework.state[:in_progress] = false
    homework.state[:accepted] = true
    notify(homework.student, "#{@name} #{@surname} accepted Your #{homework.title} answer")
  end

  def notify(student, message)
    student.notifications << Notification.new(@name, @surname, message)
  end
end
