class Posts::CommentsController < ApplicationController
  # ! 各投稿に紐付いたコメントを表示するメソッド
  def comment
    @post = Post.find(params[:post_id])
    @comments = Comment.where(post_id: params[:post_id]).order(created_at: "DESC")
    @comment = Comment.new
  end

  # ! コメントを投稿するメソッド （DB保存）
  def create
    @post = Post.find(params[:comment][:post_id])
    @comments = Comment.where(post_id: params[:post_id]).order(created_at: "DESC")
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = params[:comment][:post_id]

    if @comment.save
      redirect_to "/posts/comment/#{params[:comment][:post_id]}"
    else
      render :comment
    end
  end

  # ! コメントを削除するメソッド
  def destroy
    @comment = Comment.find(params[:comment_id])

    if @comment.destroy
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
