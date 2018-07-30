Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :welcome do
    get 'index', on: :collection
  end
  root 'projects#index'
  resources :projects, shallow: true do
    member do
        get 'setting'
        get 'assign-users'
        get 'remove_user'
      end
    resources :project_modules do
      resources :test_cases do
        member do
          get 'remove_attachment'
        end
      end
    end
  end

 # match '/users',   to: 'users#index',   via: 'get'
 resources :users_admin, :controller => 'users'
 mount Ckeditor::Engine => '/ckeditor'
end
  
