class DashboardsController < ApplicationController
  def show
    authorize :dashboard

    @categories = Category.alphabetize
    @cities = City.alphabetize
    @countries = Country.alphabetize

    @spots = PublishedAndUnpublishedSpots.new(Spot.for_user(current_user))
    @your_spots = PublishedAndUnpublishedSpots.new(Spot.author?(current_user))
  end

  private

  class PublishedAndUnpublishedSpots
    def initialize(spots)
      @spots = spots
    end

    def spots
      @spots.alphabetize
    end

    def any?
      @spots.any?
    end

    def published
      @published ||= spots.published.group_by(&:city).sort_by(&:first)
    end

    def unpublished
      @unpublished ||= spots.draft.group_by(&:city).sort_by(&:first)
    end
  end
end
