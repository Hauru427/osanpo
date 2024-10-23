RSpec.describe 'Home Page', type: :feature do
  scenario 'トップページが正しく表示される' do
    visit root_path

    expect(page).to have_content('Osanpo')
    expect(page).to have_content('ログイン')
    expect(page).to have_content('ユーザー登録')
  end
end
