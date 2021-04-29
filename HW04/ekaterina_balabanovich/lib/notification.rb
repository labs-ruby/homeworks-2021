# frozen_string_literal: true

class Notification
  attr_reader :homework, :note

  def initialize(homework)
    @homework = homework
    @note = { new: "You got new homework: '#{@homework.title}' from #{@homework.mentor.surname}",
              done: "You got '#{@homework.title} from #{@homework.student.surname} to check",
              reject: "You have been rejected from '#{@homework.title}' by #{@homework.mentor.surname}",
              accept: "You have been accepted to '#{@homework.title} by #{@homework.mentor.surname}" }
  end
end
