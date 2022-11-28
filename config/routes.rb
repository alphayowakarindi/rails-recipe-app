Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'foods#index'

  resources :foods, except: %i[update]
end
