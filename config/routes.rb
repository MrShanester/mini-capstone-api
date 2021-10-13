Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/display_all" => "products#display_all"
  get "/display_product1" => "products#display_product1"
  get "/display_product2" => "products#display_product2"
  get "/display_product3" => "products#display_product3"
end
