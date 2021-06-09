# frozen_string_literal: false

require 'student'
require 'mentor'
require 'homework'
require 'answer'

describe Student do
  subject { described_class.new(name: 'test', surname: 'test') }
  let(:mentor) { Mentor.new(name: 'John', surname: 'Doe') }
  let(:homework) { Homework.new(title: 'HW1', description: 'write tests') }
  let(:answer_first) { Answer.new(subject, 'student answer one') }
  let(:answer_second) { Answer.new(subject, 'student answer two') }

  describe '#notifications' do
    context 'when notifications is clear' do
      it 'returns an empty array' do
        expect(subject.notifications).to eq([])
      end
    end

    context 'when student has notifications' do
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

  describe '#to_work!' do
    context 'when passed no arguments' do
      it 'raises an exeption' do
        expect { subject.to_work! }.to raise_error(ArgumentError)
      end
    end

    context 'when student have no mentor' do
      it 'raises an exeption' do
        expect { subject.to_work!(homework) }.to raise_error(NoMethodError)
      end
    end

    context 'when student have mentor' do
      it 'adds new homework to student homeworks' do
        subject.mentor = mentor
        expect { subject.to_work!(homework) }.to change { subject.homeworks.count }
          .from(0).to(1)
      end

      it 'send notification to mentor' do
        subject.mentor = mentor
        expect { subject.to_work!(homework) }.to change { mentor.notifications.count }
          .from(0).to(1)
      end
    end
  end

  describe '#add_answer!' do
    let(:homework) { Homework.new }
    context 'when passed no arguments' do
      it 'raises an exeption' do
        expect { subject.add_answer! }.to raise_error(ArgumentError)
      end
    end

    context 'when all arguments are passed' do
      it 'adds new answer to homework' do
        expect { subject.add_answer!(homework, answer_first) }.to change { homework.answers.count }.by(1)
      end

      it 'modifies an existing student answer' do
        subject.add_answer!(homework, answer_first)
        expect { subject.add_answer!(homework, answer_second) }.to change { homework.answers[subject].solution }
          .from('student answer one').to('student answer two')
        expect(homework.answers.count).to eq(1)
      end
    end
  end

  describe '#to_check!' do
    context 'when no arguments passed' do
      it 'raises an exeption' do
        expect { subject.to_check! }.to raise_error(ArgumentError)
      end
    end

    context 'when student have no mentor' do
      it 'raises an exeption' do
        expect { subject.to_check!(homework) }.to raise_error(NoMethodError)
      end
    end

    context 'when student have mentor' do
      it 'send notification to mentor' do
        subject.mentor = mentor
        expect { subject.to_check!(homework) }.to change { mentor.notifications.count }.by(1)
      end

      it 'returns notifications array' do
        subject.mentor = mentor
        expect(subject.to_check!(homework)).to eq(['Homework to check: Title - HW1, Description - write tests'])
      end
    end
  end
end
