class SpotPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user.admin? || user.cities.include?(record.city)
  end

  def show?
    true
  end

  def update?
    user.admin? || record.owner == user
  end

  def destroy?
    user.admin? || record.owner == user
  end

  def toggle_status?
    user.admin? || user.cities.include?(record.city)
  end
end
