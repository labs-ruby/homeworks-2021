# frozen_string_literal: true

class Notification
  attr_reader :homework

  def initialize(homework)
    @homework = homework
  end

  def new; end

  def done; end

  def reject; end

  def accept; end
end

