class OfferPolicy < ApplicationPolicy
  def show?
    record.user == user ||  record.published?
  end

  def new?
    true
  end

  def edit?
    record.user == user
  end

  def update?
    record.user == user
  end

  def create?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
