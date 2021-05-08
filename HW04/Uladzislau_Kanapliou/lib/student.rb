# frozen_string_literal: true

class Student
  attr_reader :name, :surname, :notifications, :mentors
  attr_accessor :homeworks
  def initialize(name, surname)
    @name = name
    @surname = surname
    @notifications = []
    @homeworks = []
    @mentors = []
  end

  def mark_as_read!
    case @notifications.size
    when 0
      p "All notifications are read by #{@name} #{@surname}"
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
    notify_mentors("#{homework.title} - #{homework.state.filter { |_key, value| value == true }}")
  end

  def add_answer!(homework, notification_message)
    homework.state[:done] = true
    homework.state[:in_progress] = false
    homework.answer = notification_message
    notify_mentors("#{@name} #{@surname} add answer: #{notification_message} to #{homework.title}")
  end

  def to_check!(homework)
    notify_mentors("#{homework.title} done, please check")
  end

  def notify(mentor, message)
    mentor.notifications << Notification.new(@name, @surname, message)
  end

  def notify_mentors(message)
    @mentors.each do |mentor|
      notify(mentor, message)
    end
  end
end
