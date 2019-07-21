require 'rails_helper'

RSpec.feature "Trousers", type: :feature do
  scenario 'ボトムスを追加する' do
    user = FactoryBot.create(:user)

    visit new_user_session_path
    fill_in 'Eメール', with: user.email
    fill_in 'パスワード', with: user.password
    click_button 'ログイン'

    visit trousers_path

    expect {
      visit new_trouser_path
      find('input[type="file"]').click
      attach_file 'spec/fixtures/チノ.jpg'
      click_button '追加'
    }.to change(user.trousers, :count).by(1)
  end
end
