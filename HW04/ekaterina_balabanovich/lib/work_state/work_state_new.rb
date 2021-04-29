# frozen_string_literal: true

class WorkStateNew < WorkState
  def process
    homework.student.get_homework(homework)
    homework.student.get_notifications(homework.notification.note[:new])
  end
end
