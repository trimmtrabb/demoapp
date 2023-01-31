FactoryBot.define do
  factory :notification do
    sequence(:body) { |n| "Message # #{n}" }
  end
end
