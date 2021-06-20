# frozen_string_literal: true

require_relative '../../lib/homework'
require_relative '../../lib/student'

RSpec.describe Homework do
  describe 'attributes' do
    context 'when :title is "title" and :description is "description"' do
      subject { described_class.new('title', 'description') }
      let(:expected_attributes) { { title: 'title', description: 'description' } }

      it { is_expected.to have_attributes(expected_attributes) }
    end

    context 'when attributes are epmty' do
      subject { described_class.new('', '') }
      let(:expected_attributes) { { title: '', description: '' } }

      it { is_expected.to have_attributes(expected_attributes) }
    end

    context ':answers when first created' do
      subject { described_class.new('', '').answers }
      let(:expected_attribute_value) { [] }

      it { is_expected.to eq(expected_attribute_value) }
    end
  end

  describe '#solve' do
    let(:homework) { create(:homework) }
    subject { -> { homework.solve('answer', create(:student)) } }

    it { is_expected.to change { homework.answers.count }.by(1) }
  end

  describe '#delete_existed_answer' do
    let(:homework) { create(:homework) }
    let(:student) { create(:student) }
    let(:answer) { Answer.new(student, 'answer') }

    subject { -> { homework.send(:delete_existed_answer, student) } }

    context 'when answer is already exist' do
      before do
        homework.answers << answer
      end

      it { is_expected.to change { homework.answers.count }.from(1).to(0) }
    end

    context 'when answer is not already exist' do
      it { is_expected.to_not(change { homework.answers.count }) }
    end
  end

  describe '#find_answer_by_student' do
    let(:homework) { create(:homework) }
    let(:student) { create(:student) }
    let(:answer) { Answer.new(student, 'answer') }

    subject { homework.send(:find_answer_by_student, student) }

    context 'when answer is exist' do
      let(:expected_answer) { answer }

      before do
        homework.answers << answer
      end

      it { is_expected.to eq(expected_answer) }
    end

    context 'when answer is not exist' do
      let(:expected_answer) { nil }

      it { is_expected.to eq(expected_answer) }
    end
  end
end

