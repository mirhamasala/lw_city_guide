class DashboardsController < ApplicationController
  def show
    authorize :dashboard
    @cities = City.for(current_user)
    @unpublished_spots_by_city = Spot.draft.for_user(current_user).group_by(&:city).sort_by(&:first)
  end
end
