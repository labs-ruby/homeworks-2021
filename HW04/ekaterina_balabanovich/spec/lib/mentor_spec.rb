# frozen_string_literal: true

require_relative '../../lib/mentor'
require_relative '../../lib/homework'
require_relative '../../lib/student'

RSpec.describe Mentor do
  describe '#create_homework' do
    let(:mentor) { described_class.new('John', 'Doe') }
    subject { mentor.create_homework(title: 'HW02', description: 'do it').class }

    it { is_expected.to eq(Homework) }
  end
end
