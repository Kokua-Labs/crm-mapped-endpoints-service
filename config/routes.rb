Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: proc { [404, {}, ["Not found"]] }
    namespace 'landing' do
      post '/forms', to: 'forms#data'
    end
end
