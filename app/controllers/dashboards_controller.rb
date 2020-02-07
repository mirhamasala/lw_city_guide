class DashboardsController < ApplicationController
  def show
    authorize :dashboard

    @categories = Category.alphabetize
    @cities = City.alphabetize
    @countries = Country.alphabetize

    # You have two instances of the same thing
    # Each of these variavles contains three lists, spots, published spots, unpublisheds spots
    # But in both cases they come from a different lis
    @spots = PublishedAndUnpublishedSpots.new(Spot.for_user(current_user))

    # @spots = an instance of the PublishedAndUnpublishedSpots
    # which will call the instance method in PublishedAndUnpublishedSpots
    # @spots.published

    @your_spots = PublishedAndUnpublishedSpots.new(Spot.author?(current_user))

    # @spots = Spot.for_user(current_user)
    # @published_spots_by_city = @spots.published.alphabetize.group_by(&:city).sort_by(&:first)
    # @unpublished_spots_by_city = @spots.draft.alphabetize.group_by(&:city).sort_by(&:first)

    # @your_spots = Spot.author?(current_user)
    # @published_spots_by_city_and_author = @your_spots.published.alphabetize.group_by(&:city).sort_by(&:first)
    # @unpublished_spots_by_city_and_author = @your_spots.draft.alphabetize.group_by(&:city).sort_by(&:first)
  end

  private

  class PublishedAndUnpublishedSpots
    # attr_reader :spots

    def initialize(spots)
      @spots = spots # This variable only lives inside this class
    end

    # 1. You can either do with instance variable and attr_reader
    # def published
    #   @published ||= @spots.published.alphabetize.group_by(&:city).sort_by(&:first)
    # end

    # 2. Or you can use the getter method
    # Because lets say that you want the spots alphebetized
    # If you have the instance variable, you have to change the order in eahc of the method
    # group_by(&:city).sort_by(&:first) = Ruby which is converted into a hash

    def spots
      @spots.alphabetize
    end

    # We are writing a bare Ruby class that doesn't have any, any is coming from Enumerable via Rails (defined on the Rails relation class)
    # Any time you make a filter, Spot.where, etc. what you're getting back is a relation class, a list of spots, all those lists have each, any, because they inherit module enumerable
    def any?
      @spots.any?
    end

    # Or equals
    def published
      @published ||= spots.published.group_by(&:city).sort_by(&:first)
    end

    def unpublished
      @unpublished ||= spots.draft.group_by(&:city).sort_by(&:first)
    end

  end
end
