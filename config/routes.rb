Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'api/v1'
  namespace 'api' do
    namespace 'v1' do
      resources :companies do
        get 'workers/all'
        put 'workers/create'
      end

      resources :workers do
        get 'another_company_list'
        patch 'send_to_company'
      end
    end
  end
end
