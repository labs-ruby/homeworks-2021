# frozen_string_literal: true

class Student
  attr_reader :name, :surname

  def initialize(name, surname)
    @name = name
    @surname = surname
  end

  def notifications; end

  def mark_as_read!; end

  def homeworks; end

  def to_work!; end

  def add_answer!(homework, answer); end

  def to_check!(homework); end
end
