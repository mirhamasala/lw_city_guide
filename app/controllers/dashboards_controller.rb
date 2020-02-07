class DashboardsController < ApplicationController
  def show
    authorize :dashboard

    @categories = Category.alphabetize
    @cities = City.alphabetize
    @countries = Country.alphabetize

    @spots = Spot.for_user(current_user)


    @published_spots_by_city = @spots.published.alphabetize.group_by(&:city).sort_by(&:first)
    @unpublished_spots_by_city = @spots.draft.alphabetize.group_by(&:city).sort_by(&:first)
  end
end
