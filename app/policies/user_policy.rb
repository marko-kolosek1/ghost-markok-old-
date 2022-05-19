class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    @user.has_role? :newuser
  end

  def show?
    record == user
  end
end
