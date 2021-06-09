# frozen_string_literal: false

require 'homework'
require 'answer'
require 'student'

describe Homework do
  subject { described_class.new(title: 'test_title', description: 'test_description') }
  let(:test_student) { Student.new(name: 'test_name', surname: 'test_surname') }
  let(:test_answer_one) { Answer.new(test_student, 'test_answer_one') }
  let(:test_answer_two) { Answer.new(test_student, 'test_answer_two') }

  describe '#add_answer' do
    context 'when no arguments passed' do
      it 'raises an exeption' do
        expect { subject.add_answer }.to raise_error(ArgumentError)
      end
    end

    context 'when passed invalid arguments' do
      let(:invalid_args) { [1, 2.0, 'str', {}, [], true, false, nil, :sym] }
      it 'raises an exeption' do
        invalid_args.each do |argument|
          expect { subject.add_answer(argument) }.to raise_error(NoMethodError)
        end
      end
    end

    context 'when student add answer first time' do
      it 'Add new answer to answers variable' do
        expect { subject.add_answer(test_answer_one) }.to change { subject.answers.count }.by(1)
      end

      it 'Add a student-answer key-value pair' do
        subject.add_answer(test_answer_one)
        expect(subject.answers[test_student]).to eq(test_answer_one)
      end
    end

    context 'when student add answer one more times' do
      it 'Modifies an existent student answer' do
        subject.add_answer(test_answer_one)
        subject.add_answer(test_answer_two)
        expect { subject.add_answer(test_answer_one) }.to change { subject.answers[test_student] }
          .from(test_answer_two).to(test_answer_one)
        expect(subject.answers.count).to eq(1)
      end
    end
  end

  describe '#to_s' do
    it 'returns string representation of homework' do
      expect(subject.to_s).to eq('Title - test_title, Description - test_description')
    end
  end

  describe '#answer_status_of' do
    it 'returns student answer status' do
      subject.add_answer(test_answer_one)
      expect(subject.answer_status_of(test_student)).to eq('Answer: Solution: test_answer_one - Status: none')
    end
  end
end
