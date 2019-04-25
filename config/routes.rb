Rails.application.routes.draw do
	root "sessions#new"
	
  get 	'/new_post', to: "posts#new"
  post 	'/new_post', to: "posts#create"
  get 	'/posts',		 to: "posts#index"

  get 		"/login", 	to: "sessions#new"
  post 		"/login", 	to: "sessions#create"
  delete 	"/signout", to: "sessions#destroy"
end

