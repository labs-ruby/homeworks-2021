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
  	new_homework
  end
  def subscribe_to!(student)
  	student.attach_mentor(self)
  	p "Mentor #{@name} #{@surname} was attached to student #{student.name} #{student.surname}"
  end
  def mark_as_read!
    	case @notifications.size 
    	when 0
    		p 'All notifications are read'
		else
			notifications.clear    		
    	end
  end
end