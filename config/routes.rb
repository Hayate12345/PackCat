Rails.application.routes.draw do
  # ! トップページのルーティング
  get "/", to: "tops#home"
end
