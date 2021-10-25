Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/products" => "products#index"
  get "/products/:id" => "products#show"
  get "/products/new" => "products#new"
  post "/products" => "products#create"
  get "/products/:id/edit" => "products#edit"
  patch "/products/:id" => "products#update"
  delete "/products/:id" => "products#destroy"
  # supplier routes
  post "/suppliers" => "suppliers#create"
  patch "/suppliers/:id" => "suppliers#update"
  delete "/suppliers/:id" => "suppliers#destroy"
  get "/suppliers" => "suppliers#index"
  get "/suppliers/:id" => "suppliers#show"
  # user routes
  post "/users" => "users#create"
  # session routes
  post "/sessions" => "sessions#create"
  # order routes
  post "/orders" => "orders#create"
  patch "/orders/:id" => "orders#update"
  delete "/orders/:id" => "orders#destroy"
  get "/orders" => "orders#index"
  get "/orders/:id" => "orders#show"
end
