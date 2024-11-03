require 'rails_helper'

RSpec.describe 'ペットー登録', type: :feature do
  let(:user) { create(:user) }

  context "入力情報が正常" do
    it "ペットが新規作成できる" do
      visit new_pet_path
      expect do
        fill_in "名前",	with: "test"
        fill_in "生年月日", with: "2023-01-01"
        click_button "登録"
      end.to change { Pet.count }.by(1)
      expect(page).to have_content("ペットが登録されました")
    end
  end

  context "入力情報が異常" do
    it "ペットが新規作成に失敗する" do
      visit new_pet_path
      expect do
        fill_in "生年月日", with: "2023-01-01"
        click_button "登録"
      end.to change { Pet.count }.by(0)
      expect(page).to have_content("ペットの登録に失敗しました")
    end
  end
end
