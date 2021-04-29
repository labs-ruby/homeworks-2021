# frozen_string_literal: true

class WorkStateNew < WorkState
  def process
    homework.student.get_homework(homework)
  end
end
