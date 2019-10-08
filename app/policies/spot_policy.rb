class SpotPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user.admin? || user.cities.include?(record.city) # this is a user and relation
    # user.admin? || record.city_community_manager?(user) # just dealing with the record, returning true or fals
    # law of "demeter" - keep the number of types minimal - record.city.community_manager (spot, city, user)
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
end
