Rails.application.routes.draw do
  get 'home/home'

  resources :companies do
    resources :workers
  end

  root 'home#home'

end
