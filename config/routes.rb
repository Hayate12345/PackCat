Rails.application.routes.draw do
  devise_for :users
  # ! トップページのルーティング
  get "/", to: "tops#home"
end
