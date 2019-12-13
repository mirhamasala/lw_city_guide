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
    record.published? || admin_or_city_keeper?
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

  private

  def admin_or_city_keeper?
    user.admin? || user.city_keeper_for?(record.city)
  end
end
