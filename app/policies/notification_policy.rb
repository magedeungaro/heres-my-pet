class NotificationPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def destroy?
    true
  end

  def mark_as_read?
    true
  end

  def notifications_counter?
    true
  end

  def destroy_all?
    true
  end
end
