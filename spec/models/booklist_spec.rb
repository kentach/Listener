require 'rails_helper'

RSpec.describe Booklist, type: :model do
  it '有効なファクトリであること' do
    expect(build(:booklist)).to be_valid
  end
end