# frozen_string_literal: true

class Student
  attr_reader :name, :surname, :homeworks

  def initialize(name, surname)
    @name = name
    @surname = surname
    @homeworks = []
  end

  def notifications; end

  def mark_as_read!; end

  def to_work!; end

  def add_answer!(homework, answer); end

  def to_check!(homework); end

  def get_homework(homework)
    @homeworks << homework
  end
end
