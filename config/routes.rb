Rails.application.routes.draw do
  devise_for :users
  get 'home/home'

  get 'workers/another_company_list'

  get 'workers/send_to_company'

  resources :companies do
    resources :workers do
      get 'another_company_list'
    end
  end

  root 'companies#index'
end
