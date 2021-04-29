# frozen_string_literal: true

class WorkStateDone < WorkState
  def process
    homework.student.delete_homework(homework)
    homework.mentor.get_notification(homework.notification.note[:done])
  end
end
