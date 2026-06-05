FactoryBot.define do
  factory :textbook do
    name { '音トレ道場初段' } # テストで使うデータのテンプレートの作成をする
    level { '英検5級' }
    series { '音トレ' }
    image { 'ontra_beginner.png' }
  end
end
