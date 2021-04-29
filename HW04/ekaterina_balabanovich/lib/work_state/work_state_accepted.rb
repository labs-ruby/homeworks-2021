# frozen_string_literal: true

class WorkStateAccepted < WorkState
  def process
    homework.student.get_homework(homework)
    homework.student.get_notifications(homework.notification.note[:accept])
  end
end
