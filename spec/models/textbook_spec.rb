require 'rails_helper'

RSpec.describe Textbook, type: :model do
  describe 'バリデーション' do
    it '有効なファクトリであること' do
      expect(build(:textbook)).to be_valid # 記述方法：expect(テスト対象の値).to マッチャー(期待する値)
    end

    it 'nameがないと無効' do
      textbook = build(:textbook, name: nil)

      expect(textbook).not_to be_valid
      expect(textbook.errors[:name]).to include("を入力してください")
    end

    it 'levelがないと無効' do
      textbook = build(:textbook, level: nil)

      expect(textbook).not_to be_valid
    end

    it 'seriesがないと無効' do
      textbook = build(:textbook, series: nil)

      expect(textbook).not_to be_valid
    end

    it 'imageがないと無効' do
      textbook = build(:textbook, image: nil)

      expect(textbook).not_to be_valid
    end
  end
end
