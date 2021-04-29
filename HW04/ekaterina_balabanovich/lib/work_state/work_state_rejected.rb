# frozen_string_literal: true

class WorkStateRejected < WorkState
  def process
    homework.student.get_notifications(homework.notification.note[:reject])
  end
end
