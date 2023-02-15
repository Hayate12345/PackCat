class Profiles::ProfilesController < ApplicationController
  # ! ログイン中のユーザ情報を表示するメソッド
  def show
    @user = User.find(params[:user_id])
    @posts = Post.where(params[:user_id]).order(created_at: "DESC")
  end
end
