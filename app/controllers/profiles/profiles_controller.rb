class Profiles::ProfilesController < ApplicationController
  # ! ログイン中のユーザ情報を表示するメソッド
  def show
    @user = User.find(params[:user_id])
    @posts = Post.where(params[:user_id]).order(created_at: "DESC")
  end

  # ! ユーザ情報を更新するメソッド （フォーム入力）
  def edit
    @user = User.find(params[:user_id])
  end

  # ! ユーザ情報を更新するメソッド （DB更新）
  def update
    @user = User.find(params[:user_id])

    if @user.update(user_params)
      redirect_to "/profiles/#{params[:user_id]}"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :icon, :profile)
  end
end
