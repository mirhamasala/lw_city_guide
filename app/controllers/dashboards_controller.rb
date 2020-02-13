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
      # If @published has something, use it
      # If not assign it spots.published
      # An instance variables without a value gives nil
      # It's used every time you cal the published method
      # The method itself is basically the getter
      @published ||= spots.published
    end

    def unpublished
      @unpublished ||= spots.draft
    end

    def published_grouped_by_city
      @published_grouped_by_city ||= group_by_city(@published)
    end

    def unpublished_grouped_by_city
      @unpublished_grouped_by_city ||= group_by_city(@unpublished)
    end

    private

    def group_by_city(published_and_unpublished_spots)
      published_and_unpublished_spots.group_by(&:city).sort_by{ | city, _ | city.name }
    end
  end
end
