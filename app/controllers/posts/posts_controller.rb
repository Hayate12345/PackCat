class Posts::PostsController < ApplicationController

  # ! ログインが必要ない処理を記述
  before_action :move_to_signed_in, except: []

  # ! 投稿された投稿一覧を取得するメソッド
  def index
    @posts = Post.all.order(created_at: "DESC")
  end

  # ! 新規投稿するメソッド (フォーム入力)
  def new
    @post = Post.new
  end

  # ! 新規投稿するメソッド (DB挿入)
  def create
    @post = Post.new(post_params)

    # * 投稿者の情報を保存
    @post.user_id = current_user.id

    if @post.save
      redirect_to action: :index
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:content, :image, :amount, :place)
  end

  # ! ログインが必要場合、リダイレクトする先のパスの指定
  def move_to_signed_in
    unless user_signed_in?
      redirect_to root_path
    end
  end
end
