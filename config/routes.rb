Rails.application.routes.draw do
	root "sessions#new"

  get 		"/login", to: "sessions#new"
  post 		"/login", to: "sessions#create"
  delete 	"/signout", to: "sessions#destroy"
end

