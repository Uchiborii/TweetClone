Rails.application.routes.draw do
  root 'posts#index'
  resources :posts do
    post 'confirm', on: :collection
  end
  
end

