Rails.application.routes.draw do
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
  
