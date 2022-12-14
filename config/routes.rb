Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'foods#index'
  get '/recipes/public_recipes', to: 'recipes#public'

  resources :foods, except: %i[update]
  resources :recipes, except: %i[update] do
    resources :recipe_foods
    resources :shopping_lists, only: %i[index]
  end
end
