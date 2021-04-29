# frozen_string_literal: true

class WorkStateDone < WorkState
  def process
    homework.mentor.get_notification(homework.notification.note[:done])
  end
end
