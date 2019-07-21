require 'rails_helper'

RSpec.describe User, type: :model do

    # メール、パスワードがあれば有効な状態であること
    it "is valid with an email, and password" do
      expect(FactoryBot.create(:user)).to be_valid
    end

    # メールアドレスがなければ無効な状態であること
    it "is invalid without an email address" do
      user = FactoryBot.build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    # 重複したメールアドレスなら無効な状態であること
    it "is invalid with a duplicate email address" do
      FactoryBot.create(:user, email: 'tester@example.com')
      user = FactoryBot.build(:user, email: 'tester@example.com')
      user.valid?
      expect(user).to be_invalid
    end

    it 'has a valid factory' do
      expect(FactoryBot.build(:user)).to be_valid
    end
end
