Rails3Practice::Application.routes.draw do
  root :to => "forums#index"

  resources :forums do
    resources :posts
  end
end
