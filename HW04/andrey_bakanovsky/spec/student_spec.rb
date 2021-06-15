# frozen_string_literal: true

require_relative '../lib/mentor'
require_relative '../lib/homework'
require_relative '../lib/student'
require_relative '../lib/notification'

RSpec.describe Student do
  subject { described_class.new(name_test, surname_test) }
  let(:name_test) { 'Darren' }
  let(:surname_test) { 'McNally' }
  let(:mentor) do
    double(
      'Mentor',
      name: 'Sam',
      surname: 'Hunt',
      homeworks: [],
      notifications: []
    )
  end

  describe 'creation' do
    it 'creates a new student' do
      expect(ObjectSpace.each_object(subject.class) { |x| x }).to eq(1)
    end

    it 'create a new mentor with a first and last name' do
      expect(subject).to have_attributes(name: 'Darren')
      expect(subject).to have_attributes(surname: 'McNally')
    end
  end

  describe '#read_notifications!' do
    let(:head_notification) { 'McNally D. notifications:' }
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

  describe '#to_work!' do
    let(:homework1) { Homework.new('HW01', 'Work with the Metaprogramming', 'to do') }
    let(:homework2) { Homework.new('HW01', 'Work with the Metaprogramming', 'comments') }

    context 'when status is "to do"' do
      it 'should be changed to "in work"' do
        subject.to_work!(homework1)
        expect(homework1.status).to eq('in work')
      end
    end
    context 'when status is "comments"' do
      it 'should be changed to "fixing"' do
        subject.to_work!(homework2)
        expect(homework2.status).to eq('fixing')
      end
    end
  end

  describe '#print_homeworks_list' do
    let(:head_of_table1) { "#{subject.surname} #{subject.name[0]}. homeworks list:\n#{'-' * 86}\n" }
    let(:head_of_table2) do
      "  Title | Description                    | Mentor               | Status                         \n"
    end
    let(:head_of_table3) { "#{'-' * 86}\n" }
    let(:head_of_table) { head_of_table1 + head_of_table2 + head_of_table3 }
    let(:homework) { Homework.new('HW01', 'Work with the Metaprogramming', 'to do') }
    let(:homework_data) do
      "   HW01 | Work with the Metaprogramming  | Sam Hunt             | to do                         \n"
    end

    it 'prints head for a table' do
      homework.mentor = mentor

      subject.homeworks << homework
      expect { subject.print_homeworks_list }.to output(head_of_table + homework_data).to_stdout
    end
  end

  describe '#homeworks_list' do
    let(:no_homeworks) { "No homeworks.\n\n" }

    context 'when no homeworks' do
      it 'prints: No homeworks' do
        expect { subject.homeworks_list }.to output(no_homeworks).to_stdout
      end
    end
  end

  describe '#submit_homework!' do
    let(:homework1) { Homework.new('HW01', 'Work with the Metaprogramming', 'in work') }
    let(:homework2) { Homework.new('HW01', 'Work with the Metaprogramming', 'fixing') }

    context 'when status is "in work"' do
      it 'should be change to "submitted for verification"' do
        homework1.mentor = mentor
        subject.submit_homework!(homework1)
        expect(homework1.status).to eq('submitted for verification')
      end
    end
    context 'when status is "fixing"' do
      it 'should be change to "corrected"' do
        homework2.mentor = mentor
        subject.submit_homework!(homework2)
        expect(homework2.status).to eq('corrected')
      end
    end
  end

  describe '#ask_question' do
    let(:homework) { Homework.new('HW01', 'Work with the Metaprogramming', 'in work') }
    let(:question) { "#{mentor.name}, my question about #{homework.title}." }

    it 'sands question to the mentor' do
      homework.mentor = mentor
      subject.ask_question('my question about', homework)
      expect(homework.mentor.notifications[0].text).to eq(question)
    end
  end
end
