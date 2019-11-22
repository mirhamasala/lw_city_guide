class SpotPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user.admin? || user.city_keeper_for?(record.city)
  end

  def show?
    record.published? || (user.admin? || user.city_keeper_for?(record.city))
  end

  def update?
    user.admin? || user.city_keeper_for?(record.city)
  end

  def destroy?
    user.admin? || user.city_keeper_for?(record.city)
  end

  def update_status?
    user.admin? || user.city_keeper_for?(record.city)
  end
end
