class UserSessionsController < ApplicationController
  def new; end

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_to root_path
    else
      flash.now[:danger] = 'ログイン出来ませんでした'
      render :new
    end
  end

  def destoroy
    logout
    redirect_to root_path, status: see_other
  end
end
