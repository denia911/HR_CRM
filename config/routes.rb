Rails.application.routes.draw do
  get 'home/home'

  get 'workers/another_company_list'

  get 'workers/send_to_company'

  resources :companies do
    resources :workers do
      get 'another_company_list' do
        get 'send_to_company'
      end
    end
  end

  root 'home#home'

end
