# frozen_string_literal: true

require_relative 'work_state/work_state'
require_relative 'work_state/work_state_new'
require_relative 'work_state/work_state_done'
require_relative 'work_state/work_state_rejected'
require_relative 'work_state/work_state_accepted'

class Homework
  attr_reader :title, :description, :student, :mentor, :state, :notification
  attr_accessor :answer

  def initialize(title, description, student, mentor)
    @title = title
    @description = description
    @student = student
    @mentor = mentor
    @notification = Notification.new(self)
    transition_to(WorkStateNew.new)
  end

  def transition_to(state)
    @state = state
    @state.homework = self
    @state.process
  end

  def solve(answer)
    @answer = answer
  end
end
