require 'rails_helper'

RSpec.feature "Tops", type: :feature do
  scenario 'トップスを追加する' do
    user = FactoryBot.create(:user)

    visit new_user_session_path
    fill_in 'Eメール', with: user.email
    fill_in 'パスワード', with: user.password
    click_button 'ログイン'

    visit tops_path

    expect {
      visit new_top_path
      find('input[type="file"]').click
      attach_file 'spec/fixtures/Uniqlo1.jpg'
      click_button '追加'
    }.to change(user.tops, :count).by(1)
  end
end
