class LandingController < ApplicationController
  layout false
  def index
    render template: 'layouts/application'
  end
end
