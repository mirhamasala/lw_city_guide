class SpotPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    admin_or_city_keeper?
  end

  def show?
    admin_or_city_keeper? || record.published?
  end

  def update?
    admin_or_city_keeper?
  end

  def destroy?
    admin_or_city_keeper?
  end

  def update_status?
    admin_or_city_keeper?
  end

  # Extracting something that you're callign inside your methods, also when you do testing, you only test what's available from the outside
  # The public api for a method is everything that can be acceseed from the outside. The idea is that for every class you shoudl ahve the smallest public api possible

  private

  def admin_or_city_keeper?
    user.admin? || user.city_keeper_for?(record.city)
  end
end
