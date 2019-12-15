class CityPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user.admin?
  end

  def update?
    user.admin?
  end

  private

  def admin_or_city_keeper?
    user.admin? || user.city_keeper_for?(record)
  end
end
