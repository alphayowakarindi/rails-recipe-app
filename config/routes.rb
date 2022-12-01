Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  
  root 'foods#index'

  resources :foods, except: %i[update]
  resources :recipes, except: %i[update] do
    resources :recipe_foods
  end
end
