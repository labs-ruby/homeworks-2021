require_relative '../vladislav_mitin_hw_03_t_04'

describe 'task4' do
  let(:two_digits) { 'wicked 2.. ! 3 w' }
  let(:five_letters) { 'a 123 bcd-+32e' }

  context 'when 2 digits' do
    it { expect(task4(two_digits)[:digits]).to eq 2 }
  end

  context 'when 5 letters' do
    it { expect(task4(five_letters)[:letters]).to eq 5 }
  end

  context 'when empty' do
    character_count = task4('')

    it { expect(character_count[:letters]).to eq 0 }
    it { expect(character_count[:digits]).to eq 0 }
  end
end
