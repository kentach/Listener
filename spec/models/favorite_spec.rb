require 'rails_helper'

RSpec.describe Favorite, type: :model do
  it '有効なファクトリであること' do
    expect(build(:favorite)).to be_valid
  end
end
