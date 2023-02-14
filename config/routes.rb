Rails.application.routes.draw do
  # ! 会員登録機能、ログイン機能のルーティング
  devise_for :users

  # ! トップページのルーティング
  root to: "tops#home"
end
