class Student
	attr_reader :name, :surname, :notifications
	attr_accessor :homeworks
  def initialize(name, surname)
    @name, @surname = name , surname
    @notifications = []
    @homeworks = []
    @mentors = []
  end
  def mark_as_read!
    	case @notifications.size 
    	when 0
    		p 'All notifications are read'
		else
			notifications.clear    		
    	end
  end
  def attach_mentor(mentor)
  	@mentors << mentor
  end
  def to_work!(homework)
  	homework.state[:undone] = false
  	homework.state[:in_progress] = true
  end
  def add_answer!(homework, notification_message)
  	homework.state[:done] = true
  	homework.state[:in_progress] = false
  	homework.answer = notification_message
  end
  def to_check!(homework)
  	p "#{homework.title} done, please check"
  end
end