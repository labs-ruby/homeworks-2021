class Homework
	attr_reader :title, :description, :student
  def initialize(title, description, student)
    @title, @description, @student = title, description, student
  end
end