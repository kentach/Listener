require 'rails_helper'

RSpec.describe Lesson, type: :model do
  describe 'バリデーション' do
    it '有効なファクトリであること' do
      expect(build(:lesson)).to be_valid
    end

    context 'learning_modeが存在しない場合' do
      it '無効であること' do
        lesson = build(:lesson, learning_mode: nil)

        expect(lesson).not_to be_valid
      end
    end
  end

  describe 'enum' do
    it 'readingを持つこと' do
      expect(Lesson.learning_modes).to have_key('reading')
    end

    it 'listeningを持つこと' do
      expect(Lesson.learning_modes).to have_key('listening')
    end
  end
end
