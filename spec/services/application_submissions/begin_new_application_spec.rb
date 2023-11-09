require 'spec_helper'

RSpec.describe ApplicationSubmissions::BeginNewApplication do
  describe '#execute' do
    context 'when given a user and payload' do
      it 'creates a new application submission' do
        user = FactoryBot.create(:user)
        payload = {
          tx: '12345',
          st: 'Completed'
          amt: '100.00',
          cc: 'USD',
          cm: 'Application Fee',
          item_number: '12345',
          item_name: 'Application Fee',
          org: 'rescue',
          spec: 'dogs'
        }
      end

      it 'creates a new donation' do
      end
    end

    context 'when given an invalid payload' do
      it 'does not create a new application submission' do
      end

      it 'does not create a new donation' do
      end
    end

    context 'not provided with a user' do
      it 'does not create a new application submission' do
      end

      it 'does not create a new donation' do
      end
    end
  end
end