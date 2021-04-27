# frozen_string_literal: true

class Homework
  attr_reader :title, :description, :student, :mentor, :answers

  def initialize(title:, description:, student:, mentor:)
    @title = title
    @description = description
    @student = student
    @mentor = mentor
    @answers = []
  end
end
