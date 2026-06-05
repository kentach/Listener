FactoryBot.define do
  factory :user do
    name { 'テストユーザー' }
    email { 'test@example.com' }
    password { 'password123' }
    eiken_level { '準2級' }
  end
end