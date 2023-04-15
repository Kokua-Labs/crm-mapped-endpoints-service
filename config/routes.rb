Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: proc { [404, {}, ["Not found"]] }

  scope constraints: lambda { |req| req.host != ENV['HOST_ALLOWED'] } do
    namespace 'landing' do
      post '/forms', to: 'forms#data'
    end
  end
end
