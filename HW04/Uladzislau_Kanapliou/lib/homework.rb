class Homework
	attr_reader :title, :description
	attr_accessor :state, :answer
  def initialize(title, description)
    @title, @description = title, description
    @state = {:undone => true,:done => false, :accepted => false, :in_progress => false }
    @answer = ""
  end
end