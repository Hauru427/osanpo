module SystemHelper
  def login_as(user)
    visit root_path
    login_link = find('a', text: 'ログイン', match: :first, visible: true)
    login_link.click
    fill_in 'メールアドレス', with: user.email
    fill_in 'パスワード', with: '123456789'
    click_button 'ログイン'
  end
end

RSpec.configure do |config|
  config.include SystemHelper
end
