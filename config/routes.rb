Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: "pages#home", as: "root"
  get "/milkshakes", to: "milkshakes#index", as: "milkshakes"
  get "/milkshakes/new", to: "milkshakes#new", as: "new_milkshake"
  get "/milkshakes/:id", to: "milkshakes#show", as: "milkshake"
  post "/milkshakes", to: "milkshakes#create"

end
