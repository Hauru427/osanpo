require 'rails_helper'

RSpec.describe 'ペットー登録', type: :feature do
  let(:user) { create(:user) }

  before do
    visit login_path
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: '123456789'
    click_button 'ログイン'
  end

  context "入力情報が正常" do
    it "ワンちゃんが新規作成できる" do
      visit new_pet_path
      expect do
        fill_in "名前",	with: "test"
        select '2023', from: 'pet_birth_date_1i'  # 年
        select '1', from: 'pet_birth_date_2i'     # 月
        select '1', from: 'pet_birth_date_3i'     # 日
        click_button "登録"
      end.to change { Pet.count }.by(1)
      expect(page).to have_content("ワンちゃんが登録されました")
    end
  end

  context "入力情報が異常" do
    it "ワンちゃんが新規作成に失敗する" do
      visit new_pet_path
      expect do
        click_button "登録"
      end.to change { Pet.count }.by(0)
      expect(page).to have_content("ワンちゃんの登録に失敗しました")
    end
  end
end
