require 'rails_helper'

RSpec.describe 'ログイン・ログアウト', type: :feature do
  let(:user) { create(:user) }

  describe "通常画面" do
    describe "ログイン" do
      context "認証情報が正しい場合" do
        it "ログインできること" do
          visit '/login'
          fill_in "メールアドレス",	with: user.email
          fill_in "パスワード", with: user.password
          click_button 'ログイン'
          expect(current_path).to eq root_path
          expect(page).to have_content("ログインしました")
        end
      end

      context "PWに誤りがある場合" do
        it "ログインできないこと" do
          visit '/login'
          fill_in "メールアドレス",	with: user.email
          fill_in "パスワード", with: "12345"
          click_button 'ログイン'
          expect(current_path).to eq('/login')
          expect(page).to have_content("ログイン出来ませんでした")
        end
      end
    end
  end

end
