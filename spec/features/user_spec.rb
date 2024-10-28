require 'rails_helper'

RSpec.describe 'ユーザー登録', type: :feature do
  context "入力情報が正常" do
    it "ユーザーが新規作成できる" do
      visit 'user/new'
      expect{
        fill_in "ユーザー名",	with: "test"
        fill_in "メールアドレス", with: "test@example.com"
        fill_in "パスワード", with: "password"
        fill_in "パスワード確認", with: "password"
        click_button "登録"
      }.to change { User.count }.by(1)
      expect(page).to have_content("登録が完了しました")
    end
  end

  context "入力情報が異常" do
    it "ユーザーが新規作成に失敗する" do
      visit 'user/new'
      expect{
        fill_in "メールアドレス", with: "test@example.com"
        click_button "登録"
      }.to change { User.count }.by(0)
      expect(page).to have_content("登録に失敗しました")
    end
  end
end
