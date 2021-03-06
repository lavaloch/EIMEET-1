class PlayerPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    true
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user && record.user != record.tournament.user || record.tournament.user == user && record.user != record.tournament.user
  end
end
