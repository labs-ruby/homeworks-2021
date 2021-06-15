# frozen_string_literal: true

require_relative '../lib/mentor'
require_relative '../lib/homework'
require_relative '../lib/student'
require_relative '../lib/notification'

RSpec.describe Mentor do
  subject { described_class.new(name_test, surname_test) }
  let(:name_test) { 'Sam' }
  let(:surname_test) { 'Hunt' }
  let(:student1) do
    double(
      'Student',
      name: 'Ivan',
      surname: 'Ivanov',
      homeworks: [],
      notifications: []
    )
  end
  let(:homework) { subject.add_homework('HW01', 'Work with the Metaprogramming', student1) }

  describe 'creation' do
    it 'creates a new mentor' do
      expect(ObjectSpace.each_object(subject.class) { |x| x }).to eq(1)
    end

    it 'create a new mentor with a first and last name' do
      expect(subject).to have_attributes(name: 'Sam')
      expect(subject).to have_attributes(surname: 'Hunt')
    end
  end

  describe '#check_status_homeworks' do
    let(:head_table_part1) { "Status of all homework:\n#{'-' * 116}\n" }
    let(:head_table_part2) do
      '  Title | Description                    | Mentor               '\
      "| Student              | Status                         \n"
    end
    let(:head_table_part3) { "#{'-' * 116}\n" }
    let(:head_table) { head_table_part1 + head_table_part2 + head_table_part3 }
    let(:homeworks_data) do
      '   HW01 | Work with the Metaprogramming  | Sam Hunt             '\
      "| Ivan Ivanov          | to do                         \n\n"
    end

    it 'prints head for a table' do
      expect { subject.send(:print_head_table) }.to output(head_table).to_stdout
    end

    it "prints homework's data" do
      subject.add_homework('HW01', 'Work with the Metaprogramming', student1)
      expect { subject.check_status_homeworks }.to output(head_table + homeworks_data).to_stdout
    end
  end

  describe '#answer_all_questions!' do
    let(:no_questions) { "No questions.\n" }
    let(:head_notification) { "Hunt S. mentor's notifications:" }

    context 'when no notifications - no questions' do
      it 'prints: No notifications' do
        expect { subject.answer_all_questions! }.to output(no_questions).to_stdout
      end
    end

    context 'when exist a questions' do
      let(:notification) { Notification.new(notif_test, student1) }
      let(:notif_test)   { '- question aboute something -' }
      let(:notif_output) { "For your question \"#{notif_test}\", I recommend you to do ... " }

      it 'prints and change read status the notification with a question' do
        subject.notifications << notification
        subject.answer_all_questions!
        expect(student1.notifications[0].text).to eq(notif_output)
        expect(notification.read_status).to eq(true)
      end
    end
  end

  describe '#verification' do
    let(:homework1) { Homework.new('HW01', 'Work with the Metaprogramming', 'submitted for verification') }
    let(:homework2) { Homework.new('HW01', 'Work with the Metaprogramming', 'corrected') }

    context 'when status is "submitted for verification"' do
      it 'should be changed to "comments"' do
        homework1.student = student1
        subject.verification(homework1)
        expect(homework1.status).to eq('comments')
      end
    end

    context 'when status is "corrected"' do
      it 'should be changed to "accept"' do
        homework2.student = student1
        subject.verification(homework2)
        expect(homework2.status).to eq('accept')
      end
    end
  end

  describe '#add_homework' do
    it 'creates and returns a new instance of the Homework class' do
      expect(homework).to be_instance_of Homework
    end

    it 'creates the homework with title' do
      expect(homework.title).to eq('HW01')
    end

    it 'creates the homework with description' do
      expect(homework.description).to eq('Work with the Metaprogramming')
    end

    it 'sets status on default' do
      expect(homework.status).to_not be_nil
    end
  end

  describe '#print_notification' do
    let(:notification) do
      double(
        'Notification',
        text: 'to do HW01 - Work with the Objects',
        sender: subject,
        read_status: false
      )
    end
    let(:output_notification) { 'new From Hunt S: to do HW01 - Work with the Objects' }

    context 'when call the method' do
      it 'prints a new notification' do
        expect { subject.send(:print_notification, notification) }.to output(output_notification + "\n").to_stdout
      end
    end
  end

  describe '#print_head_notification' do
    let(:head_notification) { "Hunt S. mentor's notifications:" }

    it 'prints head of notifications' do
      expect { subject.send(:print_head_notification) }.to output(head_notification + "\n").to_stdout
    end
  end

  describe '#read_notifications!' do
    let(:head_notification) { "Hunt S. mentor's notifications:" }
    let(:no_notif) { "\nNo notifications.\n\n" }

    context 'when no notifications' do
      it 'prints: No notifications' do
        expect { subject.read_notifications! }.to output(head_notification + no_notif).to_stdout
      end
    end

    context 'when exist a notification' do
      let(:notification) { Notification.new(notif_test, subject) }
      let(:notif_test)   { 'text of the notification' }
      let(:notif_output) { "#{head_notification}\nnew From #{subject.surname} #{subject.name[0]}: #{notif_test}\n\n" }

      it 'prints and change read status the notification' do
        subject.notifications << notification
        expect { subject.read_notifications! }.to output(notif_output).to_stdout
        expect(notification.read_status).to eq(true)
      end
    end
  end
end
