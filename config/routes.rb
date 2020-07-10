Rails.application.routes.draw do
  
  get '/posts/hello', to: 'posts#hello'
  resources :posts
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
