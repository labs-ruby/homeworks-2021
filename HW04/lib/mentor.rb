require_relative 'homework'

class Mentor
	attr_reader :name, :surname
  def initialize(name, surname)
    @name, @surname = name, surname
  end
  def add_homework(title, description, student)
  	Homework.new(title, description, student)
  end
end