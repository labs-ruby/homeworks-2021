require_relative '../vladislav_mitin_hw_03_t_04'

RSpec.describe 'task4' do
  subject { task4(text) }

  context 'when text has two digits and seven letters' do
    let(:text) { 'wicked 2.. ! 3 w' }

    it { is_expected.to eq({ digits: 2, letters: 7 }) }
  end

  context 'when text has five letters and five letters' do
    let(:text) { 'a 123 bcd-+32e' }

    it { is_expected.to eq({ digits: 5, letters: 5 }) }
  end

  context 'when text is empty' do
    let(:text) { '' }

    it { is_expected.to eq({ digits: 0, letters: 0 }) }
  end
end
