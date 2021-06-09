# frozen_string_literal: false

require 'mentor'
require 'student'
require 'homework'
require 'answer'

describe Mentor do
  subject { described_class.new(name: 'John', surname: 'Doe') }
  let(:student) { Student.new(name: 'Alan', surname: 'Jakobi') }
  let(:homework) { Homework.new(title: 'HW1', description: 'write tests') }
  let(:answer) { Answer.new(student, "Alan's answer") }

  describe '#notifications' do
    context 'when notifications is clear' do
      it 'returns an empty array' do
        expect(subject.notifications).to eq([])
      end
    end

    context 'when mentor has notifications' do
      it 'returns an array with notifications' do
        subject.notification.add('Test notification 1')
        subject.notification.add('Test notification 2')
        subject.notification.add('Test notification 3')
        expect(subject.notifications).to eq(['Test notification 1', 'Test notification 2', 'Test notification 3'])
      end
    end
  end

  describe '#mark_as_read!' do
    it 'clear all notifications' do
      subject.notification.add('Test notification 1')
      subject.notification.add('Test notification 2')
      subject.notification.add('Test notification 3')
      expect { subject.mark_as_read! }.to change { subject.notifications }
        .from(['Test notification 1', 'Test notification 2', 'Test notification 3']).to([])
    end

    it 'returns an empty array' do
      expect(subject.mark_as_read!).to eq([])
    end
  end

  describe '#add_homework' do
    context 'when student argument is invalid' do
      let(:invalid_args) { [1, 1.0, nil, 'student', true, false] }
      it 'raises an exeption' do
        invalid_args.each do |argument|
          expect { subject.add_homework(student: argument) }.to raise_error(NoMethodError)
        end
      end
    end

    context 'when student argument is valid' do
      it 'send notification to student' do
        expect { subject.add_homework(title: 'HW1', description: 'write tests', student: student) }.to change {
                                                                                                         student.notifications.count
                                                                                                       }.by(1)
      end

      it 'returns homework object' do
        expect(subject.add_homework(title: 'HW1', description: 'write tests', student: student).class).to eq(Homework)
      end
    end
  end

  describe '#subscribe_to!' do
    context 'when no arguments passed' do
      it 'raises an exeption' do
        expect { subject.subscribe_to! }.to raise_error(ArgumentError)
      end
    end

    context 'when arguments passed' do
      it 'subscribes mentor to student' do
        expect { subject.subscribe_to!(student) }.to change { subject.student }.from(nil).to(student)
      end

      it 'subscribes student to mentor' do
        expect { subject.subscribe_to!(student) }.to change { student.mentor }.from(nil).to(subject)
      end
    end
  end

  describe '#reject_work!' do
    context 'when no arguments passed' do
      it 'raises an exeption' do
        expect { subject.reject_work! }.to raise_error(ArgumentError)
      end
    end

    context 'when invalid arguments passed' do
      let(:invalid_args) { [1, 1.0, nil, 'homework', true, false] }
      it 'raises an exeption' do
        invalid_args.each do |argument|
          expect { subject.reject_work!(argument) }.to raise_error(NoMethodError)
        end
      end
    end

    context 'when mentor is unsubscribed to student' do
      it 'raises an exeption' do
        student.add_answer!(homework, answer)
        expect { subject.reject_work!(homework) }.to raise_error(NoMethodError)
      end
    end

    context 'when student did not send the work to check' do
      it 'raises an exeption' do
        subject.student = student
        expect { subject.reject_work!(homework) }.to raise_error(NoMethodError)
      end
    end

    context 'when valid arguments passed' do
      it 'change student answer status to rejected' do
        subject.student = student
        student.add_answer!(homework, answer)
        expect { subject.reject_work!(homework) }.to change { homework.answers[student].status }
          .from('none').to('rejected')
      end

      it 'sends notification message to student' do
        subject.student = student
        student.add_answer!(homework, answer)
        expect { subject.reject_work!(homework) }.to change { student.notifications.count }.by(1)
      end

      it 'returns student notification array' do
        subject.student = student
        student.add_answer!(homework, answer)
        expect(subject.reject_work!(homework)).to eq(["Answer: Solution: Alan's answer - Status: rejected"])
      end
    end
  end

  describe '#accept!' do
    context 'when no arguments passed' do
      it 'raises an exeption' do
        expect { subject.accept! }.to raise_error(ArgumentError)
      end
    end

    context 'when invalid arguments passed' do
      let(:invalid_args) { [1, 1.0, nil, 'homework', true, false] }
      it 'raises an exeption' do
        invalid_args.each do |argument|
          expect { subject.accept!(argument) }.to raise_error(NoMethodError)
        end
      end
    end

    context 'when mentor is unsubscribed to student' do
      it 'raises an exeption' do
        student.add_answer!(homework, answer)
        expect { subject.accept!(homework) }.to raise_error(NoMethodError)
      end
    end

    context 'when student did not send the work to check' do
      it 'raises an exeption' do
        subject.student = student
        expect { subject.accept!(homework) }.to raise_error(NoMethodError)
      end
    end

    context 'when valid arguments passed' do
      it 'change student answer status to accepted' do
        subject.student = student
        student.add_answer!(homework, answer)
        expect { subject.accept!(homework) }.to change { homework.answers[student].status }
          .from('none').to('accepted')
      end

      it 'sends notification message to student' do
        subject.student = student
        student.add_answer!(homework, answer)
        expect { subject.accept!(homework) }.to change { student.notifications.count }.by(1)
      end

      it 'returns student notification array' do
        subject.student = student
        student.add_answer!(homework, answer)
        expect(subject.accept!(homework)).to eq(["Answer: Solution: Alan's answer - Status: accepted"])
      end
    end
  end
end
