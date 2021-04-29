# frozen_string_literal: true

require_relative 'work_state/work_state'
require_relative 'work_state/work_state_new'
require_relative 'work_state/work_state_done'

class Homework
  attr_reader :title, :description, :student, :mentor, :state, :notification

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
end
