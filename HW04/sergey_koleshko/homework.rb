class Homework
  attr_reader :title, :description, :student
  def initialize(title, description, student)
    @student = student
    @title = title
    @description = description
  end
end