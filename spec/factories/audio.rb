FactoryBot.define do
  factory :audio do
    association :lesson

    title { 'SCENE1 Q1' }
    file_name { 'scene1_q1.mp3' }
    ja_script { 'これはテストです。' }
    en_script { 'This is a test.' }
  end
end
