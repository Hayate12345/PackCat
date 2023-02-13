Rails.application.routes.draw do
  # ! トップページのルーティング
  get "/", to: "tops#top"
end
