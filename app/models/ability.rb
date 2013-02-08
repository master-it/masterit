class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.role? :admin
      can :access, :rails_admin
      can :dashboard
      can :manage, :all   
    else
      can :read, :all
    end

  end
end