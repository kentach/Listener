FactoryBot.define do
  factory :learning_record do
    association :user
    association :audio
    completed { false }
  end
end