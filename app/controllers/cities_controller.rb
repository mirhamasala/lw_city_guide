class CitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @cities = policy_scope(City).alphabetize
  end
end
