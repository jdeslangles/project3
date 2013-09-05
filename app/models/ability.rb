class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role? "admin"
      can :manage, :all
    elsif user.role? "registered"
      can [:show, :trips], User

      can [:edit, :update, :destroy, :my_profile], User do |u|
        u.id == user.id
      end

      can [:trip_interface, :new, :create, :show], Trip
      can [:edit, :update, :destroy], Trip do |t|
        t.user == user
      end

      can [:trip_interface, :new, :create, :show], Marker
      can [:edit, :update, :destroy], Marker do |m|
        m.trip.user == user
      end

    else
      can :show, :all
      can [:create, :trips], User
    end
  end
end
