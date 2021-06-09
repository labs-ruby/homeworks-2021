# frozen_string_literal: false

require 'notification'

describe Notification do
  subject { described_class.new }

  describe '#add' do
    context 'when message passed' do
      it 'add new notification' do
        expect { subject.add('test_message') }.to change { subject.messages }.from([]).to(['test_message'])
      end

      it 'returns a new notifications array' do
        expect(subject.add('test_message')).to eq(['test_message'])
      end
    end

    context 'when message is not passed' do
      it 'raises an exaption' do
        expect { subject.add }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#check_all!' do
    it 'clear all notifications' do
      subject.add('test_message')
      expect { subject.check_all! }.to change { subject.messages }.from(['test_message']).to([])
    end

    it 'returns an empty array' do
      expect(subject.check_all!).to eq([])
    end
  end

  describe '#messages' do
    it 'returns current notification list' do
      expect(subject.messages).to eq([])
      subject.add('first_notification')
      expect(subject.messages).to eq(['first_notification'])
    end
  end
end
