require 'rspec'
require_relative '../pavel_shalyga_hw_03_t_04'

RSpec.describe 'Task 4' do
  let(:empty_string) { '' }
  let(:string_without_letters_and_digits) { '!@#$%^&*()' }
  let(:string_with_digits) { '123456789' }
  let(:string_with_letters) { 'qwerty' }
  let(:string_with_letters_and_digits) { 'q1w2e3r4t5y6' }
  let(:string_with_letters_and_digits_and_chars) { 'q1!w2@e3#r4$t5%y6^' }

  describe '#task4 method' do
    context 'when string is empty' do
      it 'return 0, 0' do
        expect(task4(empty_string)).to eq({ letters: 0, digits: 0 })
      end
    end

    context 'when there are no numbers and letters in the string' do
      it 'return 0, 0' do
        expect(task4(string_without_letters_and_digits)).to eq({ letters: 0, digits: 0 })
      end
    end

    context 'when there are only digits in the string' do
      it 'return count of digits' do
        expect(task4(string_with_digits)).to eq({ letters: 0, digits: 9 })
      end
    end

    context 'when there are only letters in the string' do
      it 'return count of letters' do
        expect(task4(string_with_letters)).to eq({ letters: 6, digits: 0 })
      end
    end

    context 'when there are letters and digits in the string' do
      it 'return count of letters and digits' do
        expect(task4(string_with_letters_and_digits)).to eq({ letters: 6, digits: 6 })
      end
    end

    context 'when there are letters, digits and chars in the string' do
      it 'return count of letters and digits' do
        expect(task4(string_with_letters_and_digits_and_chars)).to eq({ letters: 6, digits: 6 })
      end
    end
  end
end
