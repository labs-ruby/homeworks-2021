# frozen_string_literal: true

require_relative '../../lib/homework_participant'

RSpec.describe HomeworkParticipant do
  describe 'attributes' do
    context 'when :member is "member" and :homework is "homework"' do
      subject { described_class.new('member', 'homework') }
      let(:expected_attributes) { { member: 'member', homework: 'homework' } }

      it { is_expected.to have_attributes(expected_attributes) }
    end

    context 'when attributes are epmty' do
      subject { described_class.new('', '') }
      let(:expected_attributes) { { member: '', homework: '' } }

      it { is_expected.to have_attributes(expected_attributes) }
    end
  end
end

