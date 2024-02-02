Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")


  root "welcome#index"
  get '/register', to: 'users#new', as: 'register_user'
  get "/users/:id/discover", to: "discover#index"
  get "/users/:user_id/movies", to: "movies#index"
  get "/users/:user_id/movies/:movie_id", to: "movies#show"
  get "/users/:user_id/movies/:movie_id/viewing_party/new", to: "viewing_party#new"
  post "/users/:user_id", to: "user_parties#create"

  resources :users, only: [:show, :create] do
  end
end
