class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :spot

  def self.check_for_scores(spot)
    spot.ratings.each do |rating|
      if rating.score == nil
        return
      end
    end
  end

  def self.average(spot)
    unless check_for_scores(spot) == nil
      sum = spot.ratings.map { |rating| rating[:score]}.reduce(:+)
      sum / spot.ratings.size
    end
  end
end
