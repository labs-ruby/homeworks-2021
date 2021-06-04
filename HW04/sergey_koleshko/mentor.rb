require_relative 'homework'

class Mentor
  attr_reader :name, :surname, :notifications

  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @notifications = []
  end

  def add_notification(message)
      notifications << Notifications.new(name, surname, message)
  end

  def notify(student, message)
    student.add_notification(message)
  end

  def add_homework(title:, description:, student:)
    new_homework = Homework.new(title, description, student)
    student.homeworks << new_homework
    notify(student, "#{@name} #{@surname} added #{title} to You")
    new_homework
  end

  def subscribe_to!(student)
    student.add_mentor(self)
    notify(student, "#{name} #{surname} subscribe to You!")
  end
end
