class Mentor
  attr_accessor :name, :surname, :notifications, :subs

  def initialize(name:, surname:, student:)
    @name = name
    @surname = surname
    @student = student
    @notifications = []
    @subs = []
  end

  def new_homework(homework)
    notification = Notification.new(homework: homework)
    student.notifications << notification
  end

  def mark_as_read!
    @notifications.clear
  end

  def subscribe_to!(student)
    @subs << student
  end

  def reject_to_work!(homework)
    notification = Notification.new(homework: homework)
    student.notifications << notification
  end

  def accept!(homework)
    notification = Notification.new(homework: homework)
    student.notifications << notification
  end
end

#Как работает эта строка?
#student.notifications << notification

#Почему вылазит ошибка mentor.rb:4:in `initialize': missing keyword: :student (ArgumentError)? 