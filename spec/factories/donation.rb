FactoryBot.define do
  factory :donation do
    txn { '123456' }
    status { 'completed' }
    amount_cents { '100' }
    category { 'application_fee' }
    amount_currency { 'USD' }
    user
    payment_method { 'paypal' }
  end
end
