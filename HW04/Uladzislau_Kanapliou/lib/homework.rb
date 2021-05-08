# frozen_string_literal: true

class Homework
  attr_reader :title, :description, :student
  attr_accessor :state, :answer
  def initialize(title, description, student)
    @student = student
    @title = title
    @description = description
    @state = { undone: true, done: false, accepted: false, in_progress: false }
    @answer = ''
  end
end
