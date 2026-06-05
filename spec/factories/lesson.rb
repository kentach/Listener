FactoryBot.define do
  factory :lesson do
    association :textbook # textbook has_many :lessonの関連付け
    title { 'Lesson 1' }
    learning_mode { 'reading' }
  end
end