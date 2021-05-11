# frozen_string_literal: true
class Mentor
  attr_reader :name, :surname
  attr_accessor :notifications, :homeworks
  
  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @homeworks = {}
    @notifications = []
  end

  def add_homework(title:, description:, student:, mentor: self)
    @hw_object = Homework.new(title: title, description: description, student: student, mentor: mentor)
    @hw_object.student_homework
    @homeworks[:title] = @hw_object.title
    @homeworks[:description] = @hw_object.description
    @homeworks[:student] = @hw_object.student
    @homeworks[:mentor] = @hw_object.mentor
    @homeworks
  end

  def notify_student
    @hw_object.student_notification
  end

  def mark_as_read!
    @notifications.clear
  end

  def approve_hw
    @hw_object.homework_approved
    "#{name} #{surname} approved #{@hw_object.student.name}'s homework!"
  end
end