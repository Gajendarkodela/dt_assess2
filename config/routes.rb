Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :welcome do
    get 'index', on: :collection
  end
  root 'welcome#index'
  resources :projects, shallow: true do
    resources :project_modules do
      resources :test_cases
    end
  end

 # match '/users',   to: 'users#index',   via: 'get'
 resources :users_admin, :controller => 'users'
end
  
