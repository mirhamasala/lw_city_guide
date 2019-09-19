class CitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_city, only: [:show]

  def index
    @cities = policy_scope(City).alphabetize
  end

end
