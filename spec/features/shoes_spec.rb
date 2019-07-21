require 'rails_helper'

RSpec.feature "Shoes", type: :feature do
    scenario 'シューズを追加する' do
      user = FactoryBot.create(:user)

      visit new_user_session_path
      fill_in 'Eメール', with: user.email
      fill_in 'パスワード', with: user.password
      click_button 'ログイン'

      visit shoes_path

      expect {
        visit new_shoe_path
        find('input[type="file"]').click
        attach_file 'spec/fixtures/エアハラチ黒.jpg'
        click_button '追加'
      }.to change(user.shoes, :count).by(1)
    end
end
