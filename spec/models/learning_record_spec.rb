require 'rails_helper'

RSpec.describe LearningRecord, type: :model do
  it '有効なファクトリであること' do
    expect(build(:learning_record)).to be_valid
  end

  context 'userがない場合' do
    it '無効であること' do
      record = build(:learning_record, user: nil)

      expect(record).not_to be_valid
    end
  end

  context 'audioがない場合' do
    it '無効であること' do
      record = build(:learning_record, audio: nil)

      expect(record).not_to be_valid
    end
  end
end
