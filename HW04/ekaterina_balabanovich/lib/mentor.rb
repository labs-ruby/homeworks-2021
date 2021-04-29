# frozen_string_literal: true

class Mentor
  attr_reader :name, :surname, :students

  def initialize(name, surname)
    @name = name
    @surname = surname
    @students = []
  end

  def add_homework(title:, description:, student:); end

  def subscribe_to!(student)
    @students << student
  end

  def notifications; end

  def mark_as_read!; end

  def reject_to_work!(homework); end

  def accept!(homework); end
end
