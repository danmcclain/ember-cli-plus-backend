class Api::V1::PeopleController < ApplicationController
  respond_to :json

  def index
    people = Person.all

    respond_with people
  end
end
