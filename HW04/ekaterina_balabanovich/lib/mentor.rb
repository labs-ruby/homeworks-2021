# frozen_string_literal: true

class Mentor
  attr_reader :name, :surname

  def initialize(name, surname)
    @name = name
    @surname = surname
  end
end
