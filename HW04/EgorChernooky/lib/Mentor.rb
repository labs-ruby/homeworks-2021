# frozen_string_literal: true
class Mentor
  def initialize(name:, surname:)
    @name = name
    @surname = surname
  end

  def add_homework(title, description, student)
    Homework.new(title: title, description: description, student: student)
  end
end