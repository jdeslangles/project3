class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role? "admin"
      can :manage, :all
    elsif user.role? "registered"
      can :manage, User do |u|
        u.id == user.id
      end
      can :read, :all
      can :manage, Trip
      can :manage, Marker
    else
      can :read, :all
      can :create, User
    end
  end
end
