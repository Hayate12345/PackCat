Rails.application.routes.draw do
  # ! 会員登録機能、ログイン機能のルーティング
  devise_for :users

  # ! トップページのルーティング
  root to: "tops#home"

  # ! 投稿機能のルーティング
  get "posts", to: "posts/posts#index"
  get "posts/new", to: "posts/posts#new"
  post "posts/create", to: "posts/posts#create"
end
