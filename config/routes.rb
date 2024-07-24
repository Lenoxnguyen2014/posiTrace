Rails.application.routes.draw do
  resources :geolocations
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  match 'all' => 'geolocations#all', :as => :all, :via=> [:get, :post]
end
