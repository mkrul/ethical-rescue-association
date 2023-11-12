FactoryBot.define do
  factory :application_submission do
    user
    donation
    status { 'pending_submission' }
  end
end
