class DashboardsController < ApplicationController
  def show
    authorize :dashboard
    @spots = Spot.author?(current_user)
    @cities = City.for(current_user)
    @published_spots = Spot.published.alphabetize.for_user(current_user)
    @unpublished_spots = Spot.draft.alphabetize.for_user(current_user)
    @unpublished_spots_by_city = @unpublished_spots.group_by(&:city).sort_by(&:first)
    @categories = Category.all.alphabetize
    @countries = Country.all.alphabetize
  end
end
