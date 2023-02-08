Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "article/home", to: "article#home"
  post "/create/article", to: "article#create"
  get "/show/articles", to: "article#show"
  put "/update/article", to: "article#update"
  delete "/delete/article", to: "article#delete"
  get "/find", to: "article#find"

  get "user/home", to: "user#home"
  post "/create/user", to: "user#create"
  get "/show/users", to: "user#show"
  post "/authenticate/user", to: "user#authenticate"
  put "/upadate/password", to: "user#update_password"
  
  


end
