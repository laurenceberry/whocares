class Ability
  include CanCan::Ability

  def initialize(resource)
    contributor ||= Contributor.new # guest user (not logged in)
    can :read, :all
    if resource.class == Contributor
      can :update, Role
      can :create, Condition
      can :update, Condition
      can :read, :all
    elsif resource.class == Admin
      can :read, :all
      can :update, :all
      can :create, :all
      can :destroy, :all
      can :manage, :all
    end
  end
end
