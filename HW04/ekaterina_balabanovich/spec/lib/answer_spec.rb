# frozen_string_literal: true

require_relative '../../lib/answer'
require_relative '../../lib/student'

RSpec.describe Answer do
  describe 'attributes' do
    context 'when :student is "John" and :answer is "answer"' do
      let(:student) { create(:student) }
      subject { described_class.new(student, 'answer') }
      let(:expected_attributes) { { student: student, answer: 'answer' } }

      it { is_expected.to have_attributes(expected_attributes) }
    end

    context 'when attributes are epmty' do
      subject { described_class.new('', '') }
      let(:expected_attributes) { { student: '', answer: '' } }

      it { is_expected.to have_attributes(expected_attributes) }
    end
  end

  describe '#show' do
    context 'when :student is "John Doe" and :answer is "my answer"' do
      let(:student) { create(:student) }
      subject { -> { described_class.new(student, 'answer').show } }
      let(:expected_output) { "Doe: answer\n" }

      it { is_expected.to output(expected_output).to_stdout }
    end
  end
end
