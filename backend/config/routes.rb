Rails.application.routes.draw do

  # Ensure this is the last route in your routes file
  constraints(lambda { |req| !(req.env["PATH_INFO"] =~ /\A\/assets\//) }) do
    get '*foo', :to => 'landing#index'
  end

  root 'landing#index'
end
