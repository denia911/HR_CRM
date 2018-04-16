Rails.application.routes.draw do
  get 'home/home'

  resources :companies

  root 'home#home'

end
