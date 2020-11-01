Rails.application.routes.draw do
  resources :videos do
    resources :comments
  end
end