Rails.application.routes.draw do
  # ! 会員登録機能、ログイン機能のルーティング
  devise_for :users

  # ! トップページのルーティング
  root to: "tops#home"

  # ! 投稿機能のルーティング
  get "posts", to: "posts/posts#index"
  get "posts/new", to: "posts/posts#new"
  post "posts/create", to: "posts/posts#create"
  get "posts/edit/:post_id", to: "posts/posts#edit"
  patch "posts/update/:post_id", to: "posts/posts#update"
  delete "posts/destroy/:post_id", to: "posts/posts#destroy"

  # ! いいね機能のルーティング
  post "posts/like_create/:post_id", to: "posts/likes#like_create"
  delete "posts/like_destroy/:post_id", to: "posts/likes#like_destroy"

  # ! コメント機能のルーティング
  get "posts/comment/:post_id", to: "posts/comments#comment"
  post "posts/comment/create", to: "posts/comments#create"
  delete "posts/comment/destroy/:comment_id", to: "posts/comments#destroy"
end
