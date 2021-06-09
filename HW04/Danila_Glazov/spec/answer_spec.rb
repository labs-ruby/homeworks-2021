# frozen_string_literal: false

require 'student'
require 'answer'

describe Answer do
  let(:test_student) { Student.new(name: 'test_name', surname: 'test_surname') }
  subject { described_class.new(test_student, 'new_solution') }

  context 'when was created' do
    it 'has status of none' do
      expect(subject.status).to eq('none')
    end

    it 'returns an Answer object' do
      expect(subject.class).to eq(Answer)
    end
  end

  describe '#rejected' do
    it 'change answer status to rejected' do
      expect { subject.rejected! }.to change { subject.status }.from(subject.status).to('rejected')
    end

    it 'returns new answer status' do
      expect(subject.rejected!).to eq('rejected')
    end
  end

  describe '#accepted' do
    it 'change answer status to accepted' do
      expect { subject.accepted! }.to change { subject.status }.from(subject.status).to('accepted')
    end

    it 'returns new answer status' do
      expect(subject.accepted!).to eq('accepted')
    end
  end

  describe '#to_s' do
    context 'when status is none' do
      it 'returns string representation of answer' do
        expect(subject.to_s).to eq('Solution: new_solution - Status: none')
      end
    end

    context 'when status is accepted or rejected' do
      it 'returns string representation of answer with status' do
        %i[accepted! rejected!].each do |method_name|
          subject.send(method_name)
          expect(subject.to_s).to eq("Solution: new_solution - Status: #{method_name.to_s.gsub('!', '')}")
        end
      end
    end
  end
end
