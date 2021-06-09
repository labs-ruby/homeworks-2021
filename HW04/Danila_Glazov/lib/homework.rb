# frozen_string_literal: false

# Class Homework is used to create new homeworks for students
class Homework
  attr_reader :title, :description, :answers

  def initialize(title: '', description: '')
    @title = title
    @description = description
    @answers = {}
  end

  def add_answer(answer)
    @answers[answer.student] = answer
  end

  def to_s
    "Title - #{@title}, Description - #{@description}"
  end

  def answer_status_of(student)
    "Answer: #{@answers[student]}"
  end
end
