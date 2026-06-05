FactoryBot.define do
  factory :favorite do
    association :user
    association :audio
  end
end
