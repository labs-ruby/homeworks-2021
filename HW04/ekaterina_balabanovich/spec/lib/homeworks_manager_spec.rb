# frozen_string_literal: true

require_relative '../../lib/homeworks_manager'
require_relative '../../lib/homework'
require_relative '../../lib/student'
require_relative '../../lib/notification'
require_relative '../../lib/homework_state/new'

RSpec.describe HomeworksManager do
  describe 'attributes' do
    let(:expected_attribute_value) { [] }

    context ':reviewers when first created' do
      subject { described_class.instance.reviewers }
      it { is_expected.to eq(expected_attribute_value) }
    end

    context ':solvers when first created' do
      subject { described_class.instance.solvers }
      it { is_expected.to eq(expected_attribute_value) }
    end

    context ':homeworks when first created' do
      subject { described_class.instance.homeworks }
      it { is_expected.to eq(expected_attribute_value) }
    end
  end

  describe '#transition_to' do
    context 'when state transitions to "New" state' do
      subject { described_class.instance.state }

      let(:students) { create_list :student, 5 }
      let(:new_state) { HomeworkState::New.new }

      before do
        described_class.instance.transition_to(new_state, students, create(:homework))
      end

      it { is_expected.to eq(new_state) }
    end
  end

  describe '#attach_new_homework' do
    subject { -> { described_class.instance.attach_new_homework(create(:homework)) } }

    it { is_expected.to change { described_class.instance.homeworks.count }.by(1) }
  end
end

