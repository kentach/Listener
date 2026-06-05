require 'rails_helper'

RSpec.describe Audio, type: :model do
  it '有効なファクトリであること' do
    expect(build(:audio)).to be_valid
  end
end
