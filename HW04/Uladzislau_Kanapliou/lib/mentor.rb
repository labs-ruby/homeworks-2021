require_relative 'homework'

class Mentor
	attr_reader :name, :surname, :notifications
  def initialize(name, surname)
    @name, @surname = name, surname
    @notifications = []
  end
  def add_homework(title, description, student)
  	new_homework = Homework.new(title, description)
  	student.homeworks << new_homework
  	notify(student, "#{@name} #{@surname} was add #{title} to You")
  	new_homework
  end
  def subscribe_to!(student)
  	student.attach_mentor(self)
  	notify(student, "Mentor was subscribed to You")
  end
  def mark_as_read!
    	case @notifications.size 
    	when 0
    		p 'All notifications are read'
		else
			notifications.clear    		
    	end
  end
  def reject_to_work!(homework)
  	homework.state[:done] = false
  	homework.state[:in_progress] = true
  end
  def accept!(homework)
  	homework.state[:done] = false
  	homework.state[:in_progress] = false
  	homework.state[:accepted] = true
  end


  def notify(student, message)
  	student.notifications << Notification.new(@name, @surname, message)
  end

end