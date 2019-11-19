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
    record.published? || user.admin? || user.cities.include(record.city)
  end

  def update?
    user.admin? || user.cities.include?(record.city)
  end

  def destroy?
    user.admin? || user.cities.include?(record.city)
  end

  def toggle_status?
    user.admin? || user.cities.include?(record.city)
  end
end
