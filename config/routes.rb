Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'
  resources :projects do
    resources :project_modules do
      resources :test_cases
    end
  end
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.h

