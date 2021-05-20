# frozen_string_literal: true

require_relative './hw_03_t_04'

describe 'task_4' do
  let!(:logs) do
    <<~LOGS
      hel2!lo
    LOGS
  end

  let!(:logs_with_empty_string) do
    <<~LOGS
    LOGS
  end

  context 'Number of letters and digits in a string' do
    it 'should return a number of letters and digits in a string when we call the task_4 method' do
      expect(task_4(logs)).to eq 'letters: 5, digits: 1'
    end
  end

  context 'Number of letters and digits in a empty string' do
    it 'should return "letters: 0, digits: 0" when we call the task_4 method' do
      expect(task_4(logs_with_empty_string)).to eq 'letters: 0, digits: 0'
    end
  end
end
