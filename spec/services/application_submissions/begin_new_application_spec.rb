require 'spec_helper'

RSpec.describe ApplicationSubmissions::BeginNewApplication do
  describe '#execute' do
    context 'when given a user and payload' do
      it 'creates a new application submission' do
        user = FactoryBot.create(:user)
        payload = {
          tx: '12345',
          st: 'Completed',
          amt: '100.00',
          cc: 'USD',
          cm: 'Application Fee',
          item_number: '12345',
          item_name: 'Application Fee',
          org: 'rescue',
          spec: 'dogs'
        }

        outcome = ApplicationSubmissions::BeginNewApplication.run(
          current_user: user,
          payload: payload
        )

        expect(outcome).to be_valid
      end

      it 'calls ApplicationSubmissions::DetermineFormUrl' do
        user = FactoryBot.create(:user)
        payload = {
          tx: '12345',
          st: 'Completed',
          amt: '100.00',
          cc: 'USD',
          cm: 'Application Fee',
          item_number: '12345',
          item_name: 'Application Fee',
          org: 'rescue',
          spec: 'dogs'
        }

        allow(ApplicationSubmissions::DetermineFormUrl).to receive(:run).and_return('https://example.com')

        ApplicationSubmissions::BeginNewApplication.run(
          current_user: user,
          payload: payload
        )

        expect(ApplicationSubmissions::DetermineFormUrl).to have_received(:run).once
      end
    end

    context 'when given an invalid payload' do
      it 'does not create a new application submission' do
        user = FactoryBot.create(:user)
        payload = {
          tx: '',
          st: '',
          amt: '',
          cc: 'USD',
          cm: 'Application Fee',
          item_number: '12345',
          item_name: 'Application Fee',
          org: 'rescue',
          spec: 'dogs'
        }

        expect { ApplicationSubmissions::BeginNewApplication.run(
          current_user: user,
          payload: payload
        ) }.to change { ApplicationSubmission.count }.by(0)
      end
    end

    context 'when donation creation fails' do
      it 'adds an error' do
        user = FactoryBot.create(:user)
        payload = {
          tx: '',
          st: '',
          amt: '100.00',
          cc: '',
          cm: 'Application Fee',
          item_number: '12345',
          item_name: 'Application Fee',
          org: 'rescue',
          spec: 'dogs'
        }

        result = ApplicationSubmissions::BeginNewApplication.run(
          current_user: user,
          payload: payload
        )

        expect(result.errors.full_messages).to include("Application submission could not be processed")
      end
    end

    context 'when application submission creation fails' do
      it 'adds an error' do
        user = FactoryBot.create(:user)
        payload = {
          tx: '12345',
          st: 'Completed',
          amt: '100.00',
          cc: 'USD',
          cm: 'Application Fee',
          item_number: '12345',
          item_name: 'Application Fee',
          org: '',
          spec: 'dogs'
        }

        result = ApplicationSubmissions::BeginNewApplication.run(
          current_user: user,
          payload: payload
        )

        expect(result.errors.full_messages).to include("Application submission could not be processed")
      end

      it 'calls ReportError' do
        user = FactoryBot.create(:user)
        payload = {
          tx: '12345',
          st: 'Completed',
          amt: '100.00',
          cc: 'USD',
          cm: 'Application Fee',
          item_number: '12345',
          item_name: 'Application Fee',
          org: 'rescue',
          spec: 'dogs'
        }

        allow(ApplicationSubmission).to receive(:create).and_raise(StandardError.new('error'))
        allow(Utils::ReportError).to receive(:run!).and_return(true)

        ApplicationSubmissions::BeginNewApplication.run(
          current_user: user,
          payload: payload
        )

        expect(Utils::ReportError).to have_received(:run!).once
      end
    end
  end
end