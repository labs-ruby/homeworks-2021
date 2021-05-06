class Notification
  attr_reader :homework

  def initialize(homework:)
    @homework = homework
  end
end