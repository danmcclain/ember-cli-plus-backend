Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :people, only: [:index, :show]
    end
  end

  if Rails.env.test?
    get '/tests' => 'tests#index'
    post '/tests/cleaner' => 'tests#destroy'
  end

  # Ensure this is the last route in your routes file
  constraints(lambda { |req| !(req.env["PATH_INFO"] =~ /\A\/assets\//) }) do
    get '*foo', :to => 'landing#index'
  end

  root 'landing#index'
end
