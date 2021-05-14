require_relative '../my_enumerable_methods'

using MyEnumerableMethods

RSpec.describe MyEnumerableMethods do
  subject { [1, 2, 3] }

  describe '#my_each' do
    context 'when method was called without block' do
      it { expect([].my_each).to be_an Enumerator }
      it { expect(subject.my_each).to be_an Enumerator }
    end

    context 'when method was called with block' do
      it { expect([].my_each { _1 + 1 }).to eq [] }
      it { expect(subject.my_each { _1 + 1 }).to eq subject }
    end
  end

  describe '#my_map' do
    context 'when method was called without block' do
      it { expect([].my_map).to be_an Enumerator }
      it { expect(subject.my_map).to be_an Enumerator }
    end

    context 'when method was called with block' do
      it { expect([].my_map { _1 + 1 }).to eq [] }
      it { expect(subject.my_map { _1 + 1 }).to eq [2, 3, 4] }
    end
  end

  describe '#my_select' do
    context 'when method was called without block' do
      it { expect([].my_select).to be_an Enumerator }
      it { expect(subject.my_select).to be_an Enumerator }
    end

    context 'when method was called with block' do
      it { expect([].my_select(&:even?)).to eq [] }
      it { expect(subject.my_select(&:even?)).to eq [2] }
    end
  end
end
