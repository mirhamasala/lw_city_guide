class DashboardsController < ApplicationController
  def show
    authorize :dashboard
    @spots = Spot.author?(current_user)
    @cities = City.for(current_user)
    @unpublished_spots = Spot.draft.for_user(current_user)
    @unpublished_spots_by_city = @unpublished_spots.group_by(&:city).sort_by(&:first)
  end
end
