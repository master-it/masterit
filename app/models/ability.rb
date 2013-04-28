class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.role? :expert
      can :manage, [Estimation, Basket]
    end
    if user.role? :moderator
      can :manage, :all
    end

    if user.role? :admin
      can :access, :rails_admin
      can :dashboard
    else
      can :read, :all
    end
  end
end
