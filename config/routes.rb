Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/display_all" => "products#display_all"
  get "/url_display/:wildcard" => "products#url_display"
  get "/display" => "products#display"
end
