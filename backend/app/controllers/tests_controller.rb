require 'database_resetter'

class TestsController < ApplicationController
  before_action :ensure_test

  layout false

  def index
    DatabaseResetter.reset
    render template: 'layouts/test'
  end

  def destroy
    DatabaseResetter.reset

    session.delete :identity_id

    return head(:ok)
  end

  private

  def ensure_test
    raise unless Rails.env.test?
  end
end
