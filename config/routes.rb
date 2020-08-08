Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :recipes, only: [:index, :show]
      resources :posts, only: [:index, :show, :create, :delete]
    end
  end
end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
