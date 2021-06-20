# frozen_string_literal: true

require_relative '../../lib/members_manager'
require_relative '../../lib/member'
require_relative '../../lib/homework'

RSpec.describe MembersManager do
  let(:manager) { (Class.new { include MembersManager }).new }
  let(:member) { create(:member) }
  let(:homework) { create(:homework) }

  before(:each) do
    manager.reviewers = []
    manager.solvers = []
  end

  describe '#attach_reviewer' do
    subject { -> { manager.attach_reviewer(member, homework) } }

    it { is_expected.to change { manager.reviewers.count }.from(0).to(1) }
  end

  describe '#attach_solver' do
    subject { -> { manager.attach_solver(member, homework) } }

    it { is_expected.to change { manager.solvers.count }.from(0).to(1) }
  end

  describe '#detach_reviewer' do
    subject { -> { manager.detach_reviewer(member, homework) } }

    before do
      manager.attach_reviewer(member, homework)
    end

    it { is_expected.to change { manager.reviewers.count }.from(1).to(0) }
  end

  describe '#detach_solver' do
    subject { -> { manager.detach_solver(member, homework) } }

    before do
      manager.attach_solver(member, homework)
    end

    it { is_expected.to change { manager.solvers.count }.from(1).to(0) }
  end

  describe '#find_reviewer' do
    subject { manager.find_reviewer(member, homework).member }

    before do
      manager.attach_reviewer(member, homework)
    end

    it { is_expected.to eq(member) }
  end

  describe '#find_solver' do
    subject { manager.find_solver(member, homework).member }

    before do
      manager.attach_solver(member, homework)
    end

    it { is_expected.to eq(member) }
  end

  describe '#find_reviewers_by_homework' do
    subject { manager.find_reviewers_by_homework(homework) }

    before do
      manager.attach_reviewer(member, homework)
    end

    it { is_expected.to eq([member]) }
  end

  describe '#find_solvers_by_homework' do
    subject { manager.find_solvers_by_homework(homework) }

    before do
      manager.attach_solver(member, homework)
    end

    it { is_expected.to eq([member]) }
  end
end
