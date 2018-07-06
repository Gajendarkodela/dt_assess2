Rails.application.routes.draw do
<<<<<<< 5a6446cd5e2fbc5e626f8caf113d98726bbf5d22
=======
  devise_for :models
>>>>>>> User Login
  resources :welcome do
    get 'index', on: :collection
  end
  root 'welcome#index'
  resources :projects, shallow: true do
    resources :project_modules do
      resources :test_cases
    end
  end
end
  
