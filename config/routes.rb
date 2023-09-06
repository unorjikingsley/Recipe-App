Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  devise_for :users

  devise_scope :user do
    authenticated :user do
      root to: 'foods#index', as: :authenticated_root
    end

    unauthenticated :user do
      root to: 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  root 'foods#index'

  match 'recipes/:recipe_id' => 'recipes#toggle_public', as: :toggle_public, via: :patch
  match 'public_recipes' => 'public_recipes#index', as: :public_recipes, via: :get
  match 'general_shopping_list' => 'recipes#general_shopping_list', as: :general_shopping_list, via: :get
  
  resources :foods
  
  resources :recipes, only: %i[index show new create destroy put update] do
    resources :recipe_foods, path: 'food', only: %i[destroy new create]
  end
end
