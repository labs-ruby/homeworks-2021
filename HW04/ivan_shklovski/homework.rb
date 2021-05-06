class Homework
  attr_accessor :title, :description, :answers

  def initialize(title:, description:)
    @title = title
    @description = description
    @answers = []
  end
end