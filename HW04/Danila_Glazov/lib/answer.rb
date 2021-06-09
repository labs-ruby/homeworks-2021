# frozen_string_literal: false

# Class Answer is used to create new student answers
class Answer
  attr_reader :student, :status, :solution

  def initialize(student, solution)
    @student = student
    @solution = solution
    @status = 'none'
  end

  def rejected!
    @status = 'rejected'
  end

  def accepted!
    @status = 'accepted'
  end

  def to_s
    "Solution: #{solution} - Status: #{status}"
  end
end
