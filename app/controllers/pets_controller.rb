class PetsController < ApplicationController
  def new
    @pet = current_user.pets.build
  end

  def create
    @pet = current_user.pets.build(pet_params)
    if @pet.save
      redirect_to dashboard_path, success: 'ワンちゃんが登録されました'
    else
      flash.now[:danger] = 'ワンちゃんの登録に失敗しました'
      render :new
    end
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :birth_date)
  end
end
