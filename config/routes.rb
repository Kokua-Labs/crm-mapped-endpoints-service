Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
<<<<<<< Updated upstream
  # root "articles#index"
=======
  root to: proc { [404, {}, ["Not found"]] }
  get '/contacts', to: 'contacts#index'
>>>>>>> Stashed changes
end
