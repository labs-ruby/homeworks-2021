# frozen_string_literal: true

require_relative '../../lib/homework'
require_relative '../../lib/notification'

RSpec.describe Notification do
  describe 'attributes' do
    context 'when :homework is provided and :status is ":new"' do
      let(:homework) { create(:homework) }
      subject { described_class.new(homework, :new) }
      let(:expected_attributes) { { homework: homework, status: :new } }

      it { is_expected.to have_attributes(expected_attributes) }
    end

    context 'when attributes are epmty' do
      subject { described_class.new('', '') }
      let(:expected_attributes) { { homework: '', status: '' } }

      it { is_expected.to have_attributes(expected_attributes) }
    end
  end

  describe '#message' do
    let(:homework) { create(:homework) }

    context 'when status "new"' do
      subject { described_class.new(homework, :new).message }

      let(:expected_message) { "You got new homework: '#{homework.title}' to work" }

      it { is_expected.to eq(expected_message) }
    end

    context 'when status "done"' do
      subject { described_class.new(homework, :done).message }

      let(:expected_message) { "You got '#{homework.title} to check" }

      it { is_expected.to eq(expected_message) }
    end

    context 'when status "reject"' do
      subject { described_class.new(homework, :reject).message }

      let(:expected_message) { "Your '#{homework.title}' have been rejected" }

      it { is_expected.to eq(expected_message) }
    end

    context 'when status "accept"' do
      subject { described_class.new(homework, :accept).message }

      let(:expected_message) { "Your '#{homework.title} have been accepted" }

      it { is_expected.to eq(expected_message) }
    end
  end
end
