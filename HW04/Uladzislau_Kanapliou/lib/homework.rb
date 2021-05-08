# frozen_string_literal: true

class Homework
  attr_reader :title, :description
  attr_accessor :state, :answer
  def initialize(title, description)
    @title = title
    @description = description
    @state = { undone: true, done: false, accepted: false, in_progress: false }
    @answer = ''
  end
end
