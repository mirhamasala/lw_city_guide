class DashboardsController < ApplicationController
  def show
    authorize :dashboard
    @cities = City.for(current_user)
    # If you call the user methods from here you have to do something really ugly like City.all.select()
    # You will have to go through all the cities and ask if the user is city or admin
    # @cities = current_user.admin? ? City.all : City.where(user: current_user) = same as line 4
    # Line 4 is better because you can reuse it
    @unpublished_spots_by_city = Spot.draft.for_user(current_user).group_by(&:city).sort_by(&:first)
  end
end
