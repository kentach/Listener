FactoryBot.define do
  factory :booklist do
    association :user # booklistには、belongs_to :user
    association :textbook # booklistには、belongs_to :textbook
  end
end