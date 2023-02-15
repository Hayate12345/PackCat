class Profiles::ProfilesController < ApplicationController
  # ! ログイン中のユーザ情報を表示するメソッド
  def show
    @user = User.find(params[:user_id])
    @posts = Post.where(params[:user_id]).order(created_at: "DESC")

    # * ユーザが拾ったゴミの総数を取得する
    @user_amount = Post.where(user_id: params[:user_id]).sum(:amount)

    # * 各投稿に紐づいたいいね数を取得し、変数に格納する
    @user_like = 0
    @posts.each do |post|
      @user_like += Like.where(post_id: post.id).count
    end
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
