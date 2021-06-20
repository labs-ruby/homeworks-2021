# frozen_string_literal: true

require_relative '../../lib/member'
require_relative '../../lib/homework'
require_relative '../../lib/notification'

RSpec.describe Member do
  let(:member) { create(:member) }

  describe 'attributes' do
    context 'when :name is "John" and :surname is "Doe"' do
      subject { create(:member) }
      let(:expected_attributes) { { name: 'John', surname: 'Doe' } }

      it { is_expected.to have_attributes(expected_attributes) }
    end

    context 'when attributes are epmty' do
      subject { described_class.new('', '') }
      let(:expected_attributes) { { name: '', surname: '' } }

      it { is_expected.to have_attributes(expected_attributes) }
    end

    context ':homeworks when first created' do
      subject { member.homeworks }
      let(:expected_attribute_value) { [] }

      it { is_expected.to eq(expected_attribute_value) }
    end

    context ':notifications when first created' do
      subject { member.notifications }
      let(:expected_attribute_value) { [] }

      it { is_expected.to eq(expected_attribute_value) }
    end
  end

  describe '#add_notifications' do
    subject { -> { member.add_notifications(Notification.new(create(:homework), :new)) } }

    it { is_expected.to change { member.notifications.count }.from(0).to(1) }
  end

  describe '#mark_as_read!' do
    subject { -> { member.mark_as_read! } }

    before do
      member.add_notifications(Notification.new(create(:homework), :new))
    end

    it { is_expected.to change { member.notifications.count }.from(1).to(0) }
  end

  describe '#add_homework' do
    subject { -> { member.add_homework(create(:homework)) } }

    it { is_expected.to change { member.homeworks.count }.from(0).to(1) }
  end

  describe '#add_homework' do
    let(:homework) { create(:homework) }
    subject { -> { member.delete_homework(homework) } }

    before do
      member.add_homework(homework)
    end

    it { is_expected.to change { member.homeworks.count }.from(1).to(0) }
  end

  describe '#to_members' do
    subject { member.to_members.class }

    it { is_expected.to eq(Array) }
  end
end
